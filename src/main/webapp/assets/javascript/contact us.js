
// Contact Us form //
// console.log(document.querySelector("#feedback_form"));
document.querySelector("#feedback_form").addEventListener("submit", function mail(e) {
    e.preventDefault();
    let details = {
        name: document.getElementById("name").value,
        number: document.getElementById("number").value,
        email: document.getElementById("email").value,
        message: document.getElementById("message").value
    };

    document.querySelector("div.box").style.display="none";
    document.querySelector("div.message_gif").style.display="";
    const gif=`
        <div class="message_note">
            <h3>Sending message!</h3>
        </div>
        <img src="../../assets/Images/Loading.gif" alt="message gif">
    `

    document.querySelector(".message_gif").innerHTML=gif;

    const serviceId = "service_tgnewnh";
    const templateId = "template_jntl1gg";

    emailjs.send(serviceId, templateId, details)
        .then((res) => {
            document.querySelector("form").reset();
            alert("Your message is sent sucessfully");
            window.location.reload();
        })
        .catch((err) => console.log(err));
}
);





