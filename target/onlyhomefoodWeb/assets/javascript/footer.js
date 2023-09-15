const { origin } = window.location;

const footer = `
        <footer>
            <div class="foot">
                <div class="footer">
                    <img src="${origin}/assets/Images/logo-facebook.svg" alt="facebook link">
                    <img src="${origin}/assets/Images/logo-instagram.svg" alt="instagram link">
                    <img src="${origin}/assets/Images/logo-twitter.svg" alt="twitter link">
                    <img src="${origin}/assets/Images/logo-whatsapp.svg" alt="whatsapp link">
                </div>
                <p>
                    No.123, Rk Road, CLV Nagar, Uthandi, Chennai - 600 119.
                </p>
                <div class="phone">
                    <div>
                        <div>
                            <img src="${origin}/assets/Images/call-outline.svg" alt="call image" height="30px" width="30px"> 
                        </div>
                            <img src="${origin}/assets/Images/mail-outline.svg" alt="mail image" height="30px" width="30px">
                    </div>
                    <div>
                        <p>+918888888889</p>
                        <p>ohfood@gmail.com</p>    
                    </div>
                </div>
            </div>
        </footer>
    `;
document.body.insertAdjacentHTML("beforeend", footer);
