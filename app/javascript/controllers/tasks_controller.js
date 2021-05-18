import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['listing'];
  static values = { url: String }

  initialize() {
    this.load();
  }

  load() {
    fetch(this.urlValue)
      .then(response => response.text())
      .then(html => this.listingTarget.innerHTML = html);
  }
}
