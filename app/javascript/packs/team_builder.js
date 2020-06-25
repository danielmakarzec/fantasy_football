// SELECTORS
//buttons
const btnGk = document.getElementById('btn-gk')
const btnD = document.getElementById('btn-d')
const btnM = document.getElementById('btn-m')
const btnF = document.getElementById('btn-f')
const buttons = document.querySelectorAll('button.btn-position')
// player
const players = document.querySelectorAll('.btn-add-player')
// tables
const tableGk = document.getElementById('table-gk')
const tableD = document.getElementById('table-d')
const tableM = document.getElementById('table-m')
const tableF = document.getElementById('table-f')
const playersLists = document.querySelectorAll('.players-per-position')

// FUNCTIONS
const savePosition = element => {
  localStorage.setItem("position", element);
}

const swithPosition = e => {
  e.preventDefault();
  playersLists.forEach(table => {
    table.style.display = 'none';
  })
  let position = e.target.attributes[2].value
  let list = document.getElementById(`list-${position}`)
  list.style.display = 'block';
  savePosition(position);
}

const getPlayerList = e => {
  e.preventDefault();
  let position;
  if (localStorage.getItem('position') == null) {
    position = 'gk'
  }
  else {
    position = localStorage.getItem('position')
  }

  document.getElementById(`list-${position}`).style.display = 'block';
}

// EVENT LISTENERS
buttons.forEach(btn => {
  btn.addEventListener("click", swithPosition)
})

document.addEventListener('DOMContentLoaded', getPlayerList)
