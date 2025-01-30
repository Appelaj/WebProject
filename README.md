<h1>ขั้นตอนการติดตั้ง</h1>
1.clone repo ไปที่ local machine <br>
2.ทำการ add database ดัวยไฟล์ database.sql <br>
คำสั่ง ไปที่ bin ของ mysql ตัวอย่างเครื่องของผม cd c:/xampp/mysql/bin <br>
จากนั้นใช้คำสั่ง mysql -u root -p < {path ของ database.sql} <br>
3.ทำการเปิด mysql ผ่าน xampp    <br>
4.จากนั้นใข้ heidi เข้าไปเพิ่มสิทธ์การเข้าถึงของuser ให้ตรงกับ <br>
DB_USER = web <br>
DB_PASSWORD = 1234 <br>
5.จากนั้นก็ไปที่ path ของ local machine เเล้วใช้คำสั่ง npm run start <br>
6.ไปตาม link ที่ขึ้นใน terminal ของ vscode <br><br>
<h1>featured ที่มี</h1><br>
1.login<br>
2.register<br>
3.homepage เเสดงทุกโพสต์ที่มีในหน้าเเรก<br>
4.post ทำการ render โพสที่เลือก<br>
&emsp;4.1 media จะมีการเเสดงสื่อ รองรับ mp4, jpg, png<br>
&emsp;4.2 comment ผู้ใช้สามารถเพิ่ม เเละ เห็นคอมเมนต์ของuserอื่นได้<br>
5.suggestion post จะทำการ สุ่มโพสต์ เพื่อเเสดงให้ผู้ใช้เลือก<br>
6.user menu กดที่สัญลักษณ์ลูกศรชึ้ลง (คลิก 2 ที)<br>
&emsp;6.1 logout<br>
&emsp;6.2 change username<br>
&emsp;6.3 change password<br>
7.your post กดที่ชื่อของผู้ใช้ที่มุมขวาบน จะทำการเเสดงโพสต์ของผู้ใช้<br>
&emsp;7.1manage post ที่โพสต์ในหน้า yout post จะมีปุ่ม manage กดเพื่อเข้าสู่หน้าจัดการ post<br>
&emsp;&emsp;7.1.1 edit post สามารถเเก้ไข หัวข้อ เนื้อความ เเละ media ภายในได้<br>
&emsp;&emsp;7.1.2 delete post ลบโพสต์ของผู้ใช้<br>
8.create post ทำการสร้างโพสต์<br>
&emsp;8.1 upload media จะมีการเเสดงสื่อ รองรับ mp4, jpg, png<br>

