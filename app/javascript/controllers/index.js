// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

// function for signup and edit user form
document.addEventListener("turbo:load", function() {
  const passwordField = document.getElementById("password_field");
  const passwordConfirmationField = document.getElementById("password_confirmation_field");
  const showPasswordCheckbox = document.getElementById("show_password_checkbox");

  if (passwordField && passwordConfirmationField && showPasswordCheckbox) {
      showPasswordCheckbox.addEventListener("change", function() {
          const showPassword = showPasswordCheckbox.checked;

          passwordField.type = showPassword ? "text" : "password";
          passwordConfirmationField.type = showPassword ? "text" : "password";
      });
  } else {
      console.error("One or more elements not found in the DOM.");
  }
});


// function for login form
document.addEventListener("turbo:load", function() {
  const passwordField = document.getElementById("password");
  const showPasswordCheckbox = document.getElementById("show_password_checkbox");

  if (passwordField && showPasswordCheckbox) {
      showPasswordCheckbox.addEventListener("change", function() {
          const showPassword = showPasswordCheckbox.checked;

          passwordField.type = showPassword ? "text" : "password";
      });
  }
});
