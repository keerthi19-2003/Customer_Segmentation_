const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");

// Show Sign Up panel when "Sign up" button is clicked
sign_up_btn.addEventListener("click", () => {
  container.classList.add("sign-up-mode");
});

// Show Sign In panel when "Sign in" button is clicked
sign_in_btn.addEventListener("click", () => {
  container.classList.remove("sign-up-mode");
});

// No other code required! Do NOT add container.classList.add("sign-up-mode") on load.
