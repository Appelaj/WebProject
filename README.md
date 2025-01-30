<h1>ขั้นตอนการติดตั้ง</h1>
1.clone repo ไปที่ local machine
2.ทำการ add database ดัวยไฟล์ database.sql 
คำสั่ง ไปที่ bin ของ mysql ตัวอย่างเครื่องของผม cd c:/xampp/mysql/bin
จากนั้นใช้คำสั่ง mysql -u root -p < {path ของ database.sql}
3.ทำการเปิด mysql ผ่าน xampp     
4.จากนั้นใข้ heidi เข้าไปเพิ่มสิทธ์การเข้าถึงของuser ให้ตรงกับ
DB_USER = web
DB_PASSWORD = 1234
5.จากนั้นก็ไปที่ path ของ local machine เเล้วใช้คำสั่ง npm run start
6.ไปตาม link ที่ขึ้นใน
