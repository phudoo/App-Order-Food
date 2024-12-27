document.getElementById('logoutButton').addEventListener('click', function() {
    localStorage.removeItem('token');

    let form = document.createElement('form');
    form.method = 'POST';
    form.action = '/logout';

    document.body.appendChild(form);
    form.submit();
});
