document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('custom_select').addEventListener('change', function(e) {
    let selectedValue = this.value;

    window.location.href = 'https://prum-portfolio.onrender.com/?selected_value=' + selectedValue;
  });

  // 現在のURLを取得
  const currentUrl = window.location.href;
  const urlParams = new URLSearchParams(new URL(currentUrl).search);
  const selectedValue = urlParams.get('selected_value');
  const optionElement = document.querySelector(`option[value="${selectedValue}"]`);
  optionElement.setAttribute('selected', 'selected');
});

