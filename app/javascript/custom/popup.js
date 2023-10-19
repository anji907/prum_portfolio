document.addEventListener('turbo:load', function() {
  const modalArea = document.getElementById('modalArea');
  if (modalArea) {
    modalArea.style.display = 'block';
  }
  const closeModal = document.getElementById('closeModal');
  closeModal.addEventListener('click', function(){
    modalArea.style.display = 'none';
  });
});