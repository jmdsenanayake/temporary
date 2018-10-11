/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PointsHandling.Contoller;

import PointsHandling.DAO.CalculatePointsDAO;
import PointsHandling.DAO.Impl.CalculatePointsDAOImpl;
import gcsm.Utitlities.Model.ResponceHandler;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import static javax.management.Query.and;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Janaka_5977
 */
@MultipartConfig(maxFileSize = 16177215)
public class CalculatePointsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        JSONObject result = new JSONObject();
        PrintWriter out = response.getWriter();
        ResponceHandler responceHandler;
        JSONArray jsArr = null;
        HttpSession session = request.getSession(false);
        String username = session.getAttribute("session_username").toString();
        String roleType = session.getAttribute("session_role_type").toString();

        try {

            CalculatePointsDAO calculatePointsDAO = new CalculatePointsDAOImpl();     
            String yearMonthFrom="201802";
            String yearMonthTo="201810";

            Map<String, String> idTargetMap = performFileReading(request);    
            
//            String yearMonthFrom = request.getParameter("yearMonthFrom");
//            String yearMonthTo = request.getParameter("yearMonthTo");        
           
            for (Map.Entry<String, String> entry : idTargetMap.entrySet()) {
                calculatePointsDAO.calculateAndStorePointDetails(yearMonthFrom, yearMonthTo, entry.getKey(), entry.getValue(), username);
            }

            jsArr = calculatePointsDAO.viewPointDetails(yearMonthFrom, yearMonthTo);
            System.out.println(jsArr);
            out.print(jsArr);

        } catch (Exception e) {
            e.printStackTrace();
        }

        out.flush();

    }

    private Map<String, String> performFileReading(HttpServletRequest request) {
        Map<String, String> idTargetMap = new HashMap();
        
        
        try {
            Part filePart = request.getPart("targetValues");
            
            String contentType = filePart.getContentType();
            DataInputStream in = new DataInputStream(filePart.getInputStream());
            System.out.println(request.getContentLength());
            System.out.println(filePart.getSize());
           // int formDataLength = request.getContentLength();
             int formDataLength = (int) filePart.getSize();
            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;

            while (totalBytesRead < formDataLength) {
                byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                totalBytesRead += byteRead;
            }

            String file = new String(dataBytes);
            System.out.println("#################");
            System.out.println(file);
            String saveFile = file.substring(file.indexOf("filename=\"") + 10);
            saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
            saveFile = file.substring(file.indexOf("filename=\"") + 10);
            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
            saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
            int lastIndex = contentType.lastIndexOf("=");
            String boundary = contentType.substring(lastIndex + 1, contentType.length());
            int pos;

            pos = file.indexOf("filename=\"");
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            int boundaryLocation = file.indexOf(boundary, pos) - 4;
            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

            FileOutputStream fileOut = new FileOutputStream(saveFile);
            fileOut.write(dataBytes, startPos, (endPos - startPos));
            String line = null;
            try {
                BufferedReader input = new BufferedReader(new FileReader(saveFile));
                while ((line = input.readLine()) != null) {
                    if (!(line.toLowerCase().contains("nic"))) {
                        String[] id_targetArr = line.split(",");
                        String relatedUser = id_targetArr[0];
                        String target = id_targetArr[1];
                        idTargetMap.put(relatedUser, target);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return idTargetMap;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String yearMonthFrom = request.getParameter("yearMonthFrom");
        String yearMonthTo = request.getParameter("yearMonthTo");

        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
