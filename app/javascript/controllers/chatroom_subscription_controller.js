import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this._insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`);
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
  _insertMessageAndScrollDown(data) {
    const currentUserIsSender = this.currentUserIdValue === data.sender_id
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  _buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message-row d-flex ${this._justifyClass(currentUserIsSender)}">
        <div class="${this._userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  _justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  _userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }

  _insertMessageAndScrollDown(data) {
    // Logic to know if the sender is the current_user
    const currentUserIsSender = this.currentUserIdValue === data.sender_id

    // Creating the whole message from the `data.message` String
    const messageElement = this._buildMessageElement(currentUserIsSender, data.message)

    // Inserting the `message` in the DOM
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
