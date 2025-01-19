javascript:(function() { 
  function clickLoadMoreButton() {
    const loadMoreButton = document.querySelector('button[data-test-id="loadMore-button"]');
    if (loadMoreButton) {
      loadMoreButton.click();
      setTimeout(clickLoadMoreButton, 1000);
    } else {
      console.log('All bets have been loaded. Now clicking the other buttons.');
      clickBetDetailsButtons();
    }
  }

  function clickBetDetailsButtons() {
    const buttons = Array.from(document.querySelectorAll('button[data-test-id="Button"].button-CMbkud6jD7'));
    if (buttons.length === 0) {
      console.log('No more buttons to click.');
      return;
    }

    // Use a function to handle clicks one at a time with delays
    let index = 0;
    function clickNextButton() {
      if (index < buttons.length) {
        buttons[index].click();
        console.log(`Clicked button ${index + 1}/${buttons.length}`);
        index++;
        setTimeout(clickNextButton, 250); // Adjust the delay as necessary
      } else {
        console.log('All bet details have been clicked.');
      }
    }

    clickNextButton();
  }

  clickLoadMoreButton();
})();
