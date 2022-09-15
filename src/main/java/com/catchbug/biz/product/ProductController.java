package com.catchbug.biz.product;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.catchbug.biz.vo.ImgVO;
import com.catchbug.biz.vo.ProductVO;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.Normalizer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class ProductController {
	
	private String uploadFolder = "https://catchbugbucket.s3.ap-northeast-2.amazonaws.com/productImg";
//	private String uploadFolder = "/Users/hyeon1339/CatchBugProject/src/main/webapp/resources/productImg";
//	private String uploadFolder = "C:\\Users\\user\\git\\CatchBug\\src\\main\\webapp\\resources\\productImg";
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AmazonS3 s3Client;

	@Value("${aws.bucketname}")
	private String bucketName;
	
	// 상품 삭제를 위한 컨트롤러
	@RequestMapping("/deleteProduct.do")
	public String DeleteProduct(ProductVO vo) {
		productService.deleteProduct(vo);
		return "redirect:stockList.do";
	}
	
	// 상품 수정페이지 이동
	@RequestMapping("/product_edit")
	public String ProductEdit(ProductVO vo, Model model) {
		
		model.addAttribute("maincategory", productService.getMainCategory());
		model.addAttribute("subCategory", JSONArray.fromObject(productService.getSubCategory()));
		model.addAttribute("product",productService.getProduct(vo));

		return "admin/product_edit";
	}
	
	@PostMapping("/updateProduct.do")
	@Transactional
	public String UpdateProduct(ProductVO vo, ImgVO ivo) {
		productService.insertImg(ivo);
		productService.updateProduct(vo);
		
		return "redirect:stockList.do";
	}

	// 상품 등록
	@RequestMapping("/productRegister.do")
	public String ProductRegister(Model model) {
		model.addAttribute("productList", JSONArray.fromObject(productService.getList()));
		model.addAttribute("maincategory", productService.getMainCategory());
		model.addAttribute("subCategory", JSONArray.fromObject(productService.getSubCategory()));
		return "admin/product_register";
	}

	@PostMapping("/insertProduct.do")
	public String InsertProduct(ProductVO vo, ImgVO ivo) {
		
		ivo.setProduct_no(vo.getProduct_no());
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); // 오라클 클라우드의 경우 시간대가 gmt로 맞추어져 있어서 사진 업로드시 생성한 폴더의 날짜를 가져옴
		try {
			Date date = formatter.parse(ivo.getUploadPath());
			vo.setAdd_day(date); 
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		
		productService.insertImg(ivo);
		productService.insertProduct(vo);


		return "redirect:productRegister.do"; // 기본은 포워드방식으로 이동
	}

	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ImgVO>> productImgAjaxUpload(MultipartFile[] uploadFile) { // 여러개의 파일을 받을때를 대비

		/* 이미지 파일 체크 */
		for (MultipartFile multipartFile : uploadFile) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;


			try {
				type = Files.probeContentType(checkfile.toPath());
			} catch (IOException e) {
				e.printStackTrace();
			}
//			/* 이미지 파일이 아닐경우 널을 반환 */
//			if (!type.startsWith("image")) {
//
//				List<ImgVO> list = null;
//				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
//
//			}

		}

		/* 이미지 파일을 저장할 경로 김현민 맥북 기준으로 작성 */
//		String uploadFolder = "/Users/hyeon1339/CatchBugProject/src/main/webapp/resources/productImg";

		/* 날짜 폴더 경로 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);
//		String datePath = str.replace("-", File.separator);

		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, str);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		/* 이미저 정보 담는 객체 */
		List<ImgVO> list = new ArrayList<ImgVO>();

		// 향상된 for
		for (MultipartFile multipartFile : uploadFile) {

			ImgVO vo = new ImgVO(); // 이미지 정보 객체 생성

			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename().replace("\\s", "_");
			uploadFileName = Normalizer.normalize(uploadFileName, Normalizer.Form.NFC);
			
			vo.setFileName(uploadFileName);
			vo.setUploadPath(str);

			/* uuid 적용 파일 이름 파일이름 중복 방지 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
		
			uploadFileName = uuid + "_" + uploadFileName;
			System.out.println(str+" "+uploadFileName);
			
			try {
				s3Client.putObject(new PutObjectRequest(bucketName, "productImg/"+str+"/"+uploadFileName, multipartFile.getInputStream(), null));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			list.add(vo);
		}

		ResponseEntity<List<ImgVO>> result = new ResponseEntity<List<ImgVO>>(list, HttpStatus.OK);

		return result;
	}

	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName) {
		System.out.println("이미지 출력작동");
		/* 이미지 경로 */
		File file = new File(uploadFolder + fileName);

		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;

	}

}
