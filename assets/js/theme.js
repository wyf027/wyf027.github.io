(function () {
    'use strict';
    var key = 'wyf-blog-theme';
    var root = document.documentElement;
    function apply(theme) {
        theme = theme === 'light' ? 'light' : 'dark';
        root.setAttribute('data-theme', theme);
        var meta = document.getElementById('theme-color');
        if (meta) meta.content = theme === 'dark' ? '#111413' : '#f5f4ef';
        var button = document.getElementById('theme-toggle');
        if (button) {
            var label = theme === 'dark' ? '切换浅色' : '切换深色';
            button.setAttribute('aria-label', label);
            button.setAttribute('title', label);
            button.querySelector('[data-theme-label]').textContent = label;
        }
    }
    var saved;
    try { saved = localStorage.getItem(key); } catch (_) { /* Storage can be disabled. */ }
    apply(saved);
    document.addEventListener('DOMContentLoaded', function () {
        apply(root.getAttribute('data-theme'));
        var button = document.getElementById('theme-toggle');
        if (!button) return;
        button.hidden = false;
        button.addEventListener('click', function () {
            var theme = root.getAttribute('data-theme') === 'dark' ? 'light' : 'dark';
            apply(theme);
            try { localStorage.setItem(key, theme); } catch (_) { /* Keep the current choice in memory. */ }
        });
    });
    window.addEventListener('storage', function (event) {
        if (event.key === key || event.key === null) apply(event.newValue);
    });
}());
