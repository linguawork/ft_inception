#!/usr/bin/env bash
		#создание нескольких папок за один раз с помощью флага -p
		mkdir -p /run/php/
		#создаем один проц для fpm
		touch /run/php/php7.3-fpm.pid
		#добавляем юзера www-data в группу www-data и даем право владения на все папки ниже 
		chown -R www-data:www-data		/var/www/*
		#даем доступ
		chmod -R 755					/var/www/*
		mkdir -p /var/www/wordpress/
if ! [ -f /var/www/wordpress/wp-config.php ]; then
		mv /var/www/wp-config.php /var/www/wordpress/
		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
		#adding permission to execute
		chmod +x wp-cli.phar
		mv wp-cli.phar /usr/local/bin/wp
		echo "ATTN!!! WP_CLI SAVED, INSTALLING WORDPRESS..."
		cd var/www/wordpress/
		#downloading word-press as root user
		wp core download --allow-root
		echo "APPLYING .env parameters to WORDPRESS..."
		wp core install --allow-root \
			--url=${WP_WEB_URL_NO_HTTP} \
			--title=${WP_SITE_NAME} \
			--admin_user=${WP_ADM_USER} \
			--admin_password=${WP_ADM_PASSWORD} \
			--admin_email=${WP_ADM_EMAIL}
		wp user create --allow-root user2 user2@42.fr --user_pass=user2
fi
#запуск одного процесса и замена им текущего процесса: "Сделайте все в этом сценарии .sh, а затем в той же оболочке выполните команду, которую пользователь передает в командной строке».
exec "$@"


