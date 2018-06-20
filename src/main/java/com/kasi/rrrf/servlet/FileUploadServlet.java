package com.kasi.rrrf.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class FileUploadServlet extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws
		IOException, ServletException
	{
		Part filePart = request.getPart("images");
	}
}
