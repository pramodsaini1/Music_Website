<%-- 
    Document   : ChangeUploadProcess
    Created on : 27 Jun, 2022, 5:23:05 PM
    Author     : Genius
--%>

<%@ page import="java.io.*" %>
<%
if( request.getParameter("album_code")!=null){
    response.sendRedirect("dashboard.jsp?code_error=1");
}
else{
        String contentType = request.getContentType();

        String imageSave=null;
        byte dataBytes[]=null;
        String saveFile=null;
        if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
        {
        DataInputStream in = new DataInputStream(request.getInputStream());
        int formDataLength = request.getContentLength();
        dataBytes = new byte[formDataLength];
        int byteRead = 0;
        int totalBytesRead = 0;
        while (totalBytesRead < formDataLength)
        {
        byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
        totalBytesRead += byteRead;
        }
         String code=request.getParameter("album_code");
        /*String code="";
        try{
            ....
            ...
            ....
        ResultSet rs=st.executeQuery("select code from table_name where email='"+email+"'");
        if(rs.next()){
            code=rs.getString(1);
        }

        } 
        catch(Exception er){

        }*/
        String file = new String(dataBytes);
        /*saveFile = file.substring(file.indexOf("filename=\"") + 10);
        saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
        saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));*/
         saveFile = code+".jpg";
        // out.print(dataBytes);
        int lastIndex = contentType.lastIndexOf("=");
        String boundary = contentType.substring(lastIndex + 1, contentType.length());
        // out.println(boundary);
        int pos;
        pos = file.indexOf("filename=\"");
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        int boundaryLocation = file.indexOf(boundary, pos) - 4;
        int startPos = ((file.substring(0, pos)).getBytes()).length;
        int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
        try
        {
        FileOutputStream fileOut = new FileOutputStream(request.getRealPath("/")+"album"+"/"+saveFile);
        


        // fileOut.write(dataBytes);
        fileOut.write(dataBytes, startPos, (endPos - startPos));
        fileOut.flush();
        fileOut.close();
        response.sendRedirect("edit_album.jsp?code="+code+"&image_updated=1");
        }catch (Exception e)
        {

        response.sendRedirect("edit_album.jsp?code="+code+"&img_err=1");
        }
        }
}
//response.sendRedirect("index.jsp");
%> 