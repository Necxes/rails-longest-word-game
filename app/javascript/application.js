// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// DOMs
const letterBoxes = document.querySelectorAll('.letterbox');
const inputField = document.getElementById('form-input');


letterBoxes.forEach((letterBox) => {
  const letter = letterBox.innerText;


  letterBox.addEventListener('click', (event) => {
    // Toggle Active class on button press
    letterBox.classList.toggle('active');

    // Put button content into input field
    if (letterBox.classList.contains('active')) {
      inputField.value += letter;
    }
  });
});
