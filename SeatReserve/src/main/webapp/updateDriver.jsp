<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Driver</title>
</head>
<body>
    <h2>Update Driver Details</h2>
    <form action="updateDriverServlet" method="post">
        <input type="hidden" name="id" value="${driver.id}" />
        <div>
            <label for="dname">Driver Name</label>
            <input type="text" name="dname" value="${driver.dname}" required />
        </div>
        <div>
            <label for="phonenum">Phone Number</label>
            <input type="text" name="phonenum" value="${driver.phone}" required />
        </div>
        <div>
            <label for="email">Email</label>
            <input type="email" name="email" value="${driver.email}" required />
        </div>
        <div>
            <label for="nic">NIC</label>
            <input type="text" name="nic" value="${driver.nic}" required />
        </div>
        <div>
            <label for="uname">Username</label>
            <input type="text" name="uname" value="${driver.username}" required />
        </div>
        <div>
            <label for="pass">Password</label>
            <input type="password" name="pass" value="${driver.password}" required />
        </div>
        <button type="submit">Update Driver</button>
    </form>
</body>
</html>
