import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="randomizer"
export default class extends Controller {
  static targets = ['modal', 'select', 'result']
  static values = {students: Array}

  toggle() {
    this.modalTarget.classList.toggle('hidden');
    this.resultTarget.innerHTML = '';
  }

  randomize() {
    this.resultTarget.innerHTML = '';
    const result = this.shuffleArray(this.studentsValue).slice(0, this.selectTarget.value);
    for (const student of result) {
      var studentElement = document.createElement('p');
      studentElement.textContent = student.firstname;
      this.resultTarget.appendChild(studentElement);
    }
  }

  shuffleArray(array) {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
  }
}
