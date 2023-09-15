function signUp(e) {
  e.preventDefault();
  let user_name = document.getElementById("user_name").value.trim().split(/\s+/g).join(" ");
  let user_phonenumber = document.getElementById("user_phonenumber").value;
  let user_email = document.getElementById("user_email").value;
  // let user_address = document.getElementById("user_address").value.trim().split(/\s+/g).join(" ");
  let user_password = document.getElementById("user_password").value;
  let confirm_password = document.getElementById("confirm_password").value;

  function check_phonenumber() {
    let result = 0;
    for (let i = 0; i < user_phonenumber.length; i++) {
      if (user_phonenumber[0] === user_phonenumber[i]) {
        result += 1;
      } else {
        break;
      }
    }
    if (result === 10) {
      alert("Enter your number properly");
      user_phonenumber.value = reset();
    }
  }
  function validate() {
    if (/^\s*$/g.test(user_name)) {
      alert("Write your information properly");
      user_name = reset();
    }
  }
  function checkPassword() {
    if (user_password !== confirm_password) {
      alert("Re-enter the Password");
      confirm_password.value = reset();
    }
  }
  validate();
  check_phonenumber();
  checkPassword();

  const user_list = JSON.parse(localStorage.getItem("user_list")) || [];

  const exist =
    user_list.length &&
    JSON.parse(localStorage.getItem("user_list")).some(
      (data) =>
        data.user_phonenumber.toLowerCase() ===
        user_phonenumber.toLowerCase() ||
        data.user_email.toLowerCase() === user_email.toLowerCase()
    );

  if (!exist) {
    user_list.push({
      user_name,
      user_phonenumber,
      user_email,
      // user_address,
      user_password,
    });

    localStorage.setItem("user_list", JSON.stringify(user_list));

    document.querySelector("form").reset();
    document.getElementById("user_phonenumber").focus();
    document.getElementById("user_email").focus();
    alert("Account created Successfully");
    location.href = "./Login.html";
  } else {
    alert(
      "Sorry the User already Exist!! \n Try with different Phone number or email"
    );
    document.querySelector("form").reset();
  }
}

function signIn(e) {
  e.preventDefault();
  const user_phonenumber = document.getElementById("user_phonenumber").value;
  const user_password = document.getElementById("user_password").value;

  function check_phonenumber() {
    let result = 0;
    for (let i = 0; i < user_phonenumber.length; i++) {
      if (user_phonenumber[0] === user_phonenumber[i]) {
        result += 1;
      } else {
        break;
      }
    }
    if (result === 10) {
      alert("Enter your number properly");
      user_phonenumber.value = reset();
    }
  }
  check_phonenumber();

  const user_list = JSON.parse(localStorage.getItem("user_list")) || [];

  const exist =
    user_list.length &&
    JSON.parse(localStorage.getItem("user_list")).some(
      (data) =>
        data.user_phonenumber === user_phonenumber &&
        data.user_password === user_password
    );

  if (!exist) {
    alert("Incorrect login credentials");
    document.querySelector("form").reset();
  } else if (user_phonenumber === "8888888889") {
    alert("Welcome admin");
    window.location.href = "../../Pages/Admin/product create.html";
  } else {
    localStorage.setItem("userId", JSON.stringify(user_phonenumber));
    alert("Your login in successful");
    window.location.href = "../../Pages/Login and Order/Profile.html";
  }
}
