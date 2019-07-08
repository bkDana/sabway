package kr.co.subway.ingreManage.vo;


import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Workbook;

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

public class ExcelDown {
	public void download(HttpServletRequest request, HttpServletResponse response, Map<String, Object> data,
			String fileName, String templateFile, String string) throws ParsePropertyException, InvalidFormatException {

		String tempPath = request.getSession().getServletContext().getRealPath("/resources/upload/excel");

		try {

			InputStream is = new BufferedInputStream(new FileInputStream(tempPath + "\\" + templateFile));
			XLSTransformer xls = new XLSTransformer();

			Workbook workbook = xls.transformXLS(is, data);

			response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + ".xlsx\"");	
			OutputStream os = response.getOutputStream();

			workbook.write(os);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

