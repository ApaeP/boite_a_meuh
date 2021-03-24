
const stopAndResetSound = (player) => {
  player.pause(); // Pause the player
  player.currentTime = 0; // Reset the player
};

const stopAndResetAllSounds = (players, buttons) => {
  players.forEach((player) => {
    stopAndResetSound(player);
  });
  buttons.forEach((btn) => {
    btn.classList.remove('active');
    btn.innerHTML = 'Play';
  });
};

const playAndStopOnClick = () => {
  const playButtons = document.querySelectorAll('.play-btns');
  const soundPlayers = document.querySelectorAll('.sound-bars');
  playButtons.forEach((btn) => {
    btn.addEventListener('click', (event) => {
      let sound = document.querySelector(`#sound-${btn.dataset.id}`);
      if (btn.classList.contains('active')) {
        stopAndResetSound(sound);
        btn.classList.remove('active');
        btn.innerHTML = 'Play';
      } else {
        stopAndResetAllSounds(soundPlayers, playButtons);
        sound.play();
        btn.classList.add('active');
        btn.innerHTML = 'Stop';
      }
    });
  });
  soundPlayers.forEach((soundPlayer) => {
    soundPlayer.onended = function () {
      soundPlayer.currentTime = 0;
      let btn = document.querySelector(`#play-${soundPlayer.dataset.id}`);
      btn.classList.remove('active');
      btn.innerHTML = 'Play';
    };
  });
};

export { playAndStopOnClick };

