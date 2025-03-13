Introduction
• Project demo: good-coffee.kvalitne.cz
• Created as part of the Web Application Developer course by PrimaKurzy.cz
• PrimaKurzy: primakurzyonline.cz/kurz-vyvojar-www-aplikaci
• Built using vanilla PHP, JavaScript, HTML, and CSS
• Uses MySQL as the database system
• Includes an admin panel for content editing

Installation
• No installation required (includes vendor folder)
• Requires only a local server and MySQL
• The database connection details on Windows are in config.php
• Recommended package for Windows: XAMPP

Technologies Used
• Thunderer/Shortcode (shortcode support) + helper
  • Shortcodes: github.com/thunderer/Shortcode 
  • Shortcodes-helper: github.com/PrimaKurzy-cz/shortcode
• PhotoSwipe (image viewer)
• PHPMailer (SMTP email sending)
• TinyMCE (WYSIWYG editor) + Responsive FileManager
  • Responsive FileManager: github.com/PrimaKurzy-cz/responsivefilemanager
• Tweeb (extensive language support for TinyMCE)
  • Tweeb/tinymce-i18n: packagist.org/packages/tweeb/tinymce-i18n

Content Editing
• Admin panel: good-coffee.kvalitne.cz/admin.php
• Create your own login credentials
• After logging in, you can edit the website content (except for the header and footer)
• Option to add or remove navigation items

Security
• For increased security, it is recommended to move config.php outside the public directory
• On hosting providers, a public directory is usually available—upload the project there and place config.php one level above
• Alternatively, use .htaccess to restrict access to config.php
• If config.php is moved above the public directory, update stranky.php accordingly: require __DIR__ . "/../config.php";









