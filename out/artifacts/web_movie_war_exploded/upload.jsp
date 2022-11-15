<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/11/15
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>


<body>

<s:form action="uploads" method="post" enctype="multipart/form-data">
    <s:file name="uploadImage" label="选择上传的文件" />
    <s:submit value="上传" />
</s:form>
</body>

</html>
