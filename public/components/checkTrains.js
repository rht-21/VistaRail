document.addEventListener('click', function (e) {
    if (!e.target.matches('.dropbtn')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        for (var d = 0; d < dropdowns.length; d++) {
            var openDropdown = dropdowns[d];
            if (openDropdown.style.display === 'block') {
                openDropdown.style.display = 'none';
            }
        }
    }
});

fetch('/cities')
    .then(response => response.json())
    .then(cityNames => {
        const dropdown = document.getElementById('origin');
        cityNames.forEach(cityName => {
            const option = document.createElement('option');
            option.text = cityName;
            dropdown.add(option);
        });
    });

fetch('/cities')
    .then(response => response.json())
    .then(cityNames => {
        const dropdown = document.getElementById('destination');
        cityNames.forEach(cityName => {
            const option = document.createElement('option');
            option.text = cityName;
            dropdown.add(option);
        });
    });