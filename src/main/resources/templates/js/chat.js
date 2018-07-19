const chatPage   = $(document);
const chatWindow = $('.chatbubble');
const chatHeader = chatWindow.find('.unexpanded');
const chatBody   = chatWindow.find('.chat-window');

function toggleChatWindow() {
    chatWindow.toggleClass('opened');
    chatHeader.find('.title').text(
        chatWindow.hasClass('opened') ? 'Minimize Chat Window' : 'Chat with Support'
    )
}

function showAppropriateChatDisplay() {
    showChatInitiationDisplay();
    if(chatBody.find('.chats').hasClass('active'))
        showChatRoomDisplay();
}

function showChatInitiationDisplay() {
    chatBody.find('.chats').removeClass('active');
    chatBody.find('.login-screen').addClass('active');
}

function showChatRoomDisplay() {
    chatBody.find('.chats').addClass('active');
    chatBody.find('.login-screen').removeClass('active');
}

function logIntoChatSession() {
    const name  = $('#name').val().trim();

    // Disable the form
    $('.chatbubble').find('.chat-window').find('#loginScreenForm input, #loginScreenForm button').attr('disabled', true);

    if(name !== '' && name.length >= 3) {
        showChatRoomDisplay();
    } else {
        alert('Por favor,inserte un nombre válido');
    }
}

chatPage.ready(showAppropriateChatDisplay());
chatHeader.click(toggleChatWindow());

