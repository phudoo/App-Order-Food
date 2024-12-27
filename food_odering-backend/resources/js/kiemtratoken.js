   // Kiểm tra token ngay khi trang bắt đầu tải
   const token = localStorage.getItem('token');
   if (!token) {
       alert('Bạn chưa đăng nhập'); // Hiển thị thông báo
       window.location.href = '/login'; // Chuyển hướng tới trang đăng nhập
   }