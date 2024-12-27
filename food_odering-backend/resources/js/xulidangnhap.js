
// Xử lý đăng nhập
document.getElementById('loginForm').addEventListener('submit', async function (event) {
    event.preventDefault();

    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    try {
        const response = await fetch('/api/auth/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            body: JSON.stringify({ email, password })
        });

        if (!response.ok) {
            throw new Error('Login failed');
        }

        const data = await response.json();
        localStorage.setItem('token', data.access_token);

        window.location.href = '/products'; // Chuyển hướng tới trang quản lý sản phẩm
    } catch (error) {
        alert('Bạn Nhập Sai Tài Khoản Hoặc Mật Khẩu: ' + error.message);
    }
});



