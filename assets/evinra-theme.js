// EVINRA THEME MANAGER
(function() {
  const THEME_KEY = 'evinra-theme';

  // Initialize theme
  function initTheme() {
    const savedTheme = localStorage.getItem(THEME_KEY) || 'dark';
    setTheme(savedTheme);
  }

  // Set theme
  function setTheme(theme) {
    const body = document.body;
    if (theme === 'light') {
      body.classList.add('light-mode');
      localStorage.setItem(THEME_KEY, 'light');
      updateThemeButtons('light');
    } else {
      body.classList.remove('light-mode');
      localStorage.setItem(THEME_KEY, 'dark');
      updateThemeButtons('dark');
    }
  }

  // Get current theme
  function getCurrentTheme() {
    return document.body.classList.contains('light-mode') ? 'light' : 'dark';
  }

  // Update theme toggle buttons
  function updateThemeButtons(theme) {
    const buttons = document.querySelectorAll('.theme-toggle');
    buttons.forEach(btn => {
      if (theme === 'light') {
        btn.innerHTML = '<i class="hgi-stroke hgi-moon-02"></i><span>Dark</span>';
      } else {
        btn.innerHTML = '<i class="hgi-stroke hgi-sun"></i><span>Light</span>';
      }
    });
  }

  // Toggle theme
  function toggleTheme() {
    const currentTheme = getCurrentTheme();
    setTheme(currentTheme === 'light' ? 'dark' : 'light');
  }

  // Setup event listeners
  function setupEventListeners() {
    const buttons = document.querySelectorAll('.theme-toggle');
    buttons.forEach(btn => {
      btn.addEventListener('click', toggleTheme);
    });
  }

  // Initialize on load
  document.addEventListener('DOMContentLoaded', function() {
    initTheme();
    setupEventListeners();
  });

  // Expose to window for manual calls
  window.EvinraTheme = {
    set: setTheme,
    get: getCurrentTheme,
    toggle: toggleTheme
  };
})();
