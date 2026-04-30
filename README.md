# Ultra-Slim Laravel & PHP Frameworks Image (NGINX + PHP-FPM)

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Laravel Framework](https://img.shields.io/badge/Laravel-11.x-red.svg)](https://laravel.com)

Repositori ini berisi konfigurasi **Single Layer Docker Image** yang menggabungkan NGINX dan PHP-FPM dalam satu container. Dirancang khusus untuk kebutuhan deployment PHP yang ringkas, cepat, dan memiliki dependensi ekstensi yang lengkap.

## 🧩 Compatibility
Image ini tidak hanya dioptimasi untuk **Laravel**, tetapi juga mendukung penuh framework PHP lainnya seperti:
*   **CodeIgniter 3.x & 4.x** (High performance environment)
*   **Symfony** (Enterprise standard)
*   **Yii2** (Robust configurations)
*   **CMS Platforms** (WordPress, Drupal, Joomla)
*   **Native PHP Applications**
    
## 🚀 Fitur Utama

- **Ultra Lightweight**: Ukuran image hanya **60MB**, mempercepat proses *pulling* dan *deployment*.
- **Default Workdir**: Aplikasi ditempatkan di `/var/www/html`.
- **Process Manager**: Menggunakan Supervisor untuk menjaga NGINX dan PHP-FPM tetap running.
- **Universal Support**: Cocok untuk Laravel, CodeIgniter (CI3/CI4), Symfony, dan aplikasi PHP Native.
  
## 🛠️ PHP Extensions Terpasang

Image ini sangat lengkap, mendukung hampir semua fitur framework Laravel dan library pihak ketiga:

| Kategori | Ekstensi PHP |
| :--- | :--- |
| **Core & Logic** | `bcmath`, `ctype`, `curl`, `date`, `dom`, `fileinfo`, `filter`, `hash`, `iconv`, `json`, `libxml`, `mbstring`, `openssl`, `pcre`, `Phar`, `posix`, `random`, `readline`, `Reflection`, `session`, `SimpleXML`, `sodium`, `SPL`, `standard`, `tokenizer`, `xml`, `xmlreader`, `xmlwriter` |
| **Database** | `PDO`, `pdo_mysql`, `mysqlnd`, `pdo_pgsql`, `pgsql`, `pdo_sqlite`, `sqlite3` |
| **Performance** | `Zend OPcache`, `redis` |
| **Integration** | `ldap`, `ftp`, `gd`, `zip`, `zlib` |

## 📦 Cara Penggunaan

###  Build Image

docker build -t php-nginx-slim:latest .

## 🐳 Menjalankan dengan Docker Compose

Untuk kemudahan pengembangan, repositori ini sudah menyertakan file `docker-compose.yml`. Cukup jalankan perintah berikut:

docker-compose up -d

## Aplikasi Laravel kamu akan dapat diakses di http://localhost:8080
