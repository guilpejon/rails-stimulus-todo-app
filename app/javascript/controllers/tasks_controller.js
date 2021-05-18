import { Controller } from "stimulus"
import consumer from '../channels/consumer'

export default class extends Controller {
  static targets = ['listing'];
  static values = { url: String }

  initialize() {
    this.load();
  }

  connect() {
    this.subscription = consumer.subscriptions.create(
      {
        channel: "TasksChannel"
      },
      {
        received: this._received.bind(this),
      }
    );
  }

  _received(data) {
    this.load();
  }

  load() {
    fetch(this.urlValue)
      .then(response => response.text())
      .then(html => this.listingTarget.innerHTML = html);
  }
}
