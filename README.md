##Temática: Plataforma y servicio de Streaming

Plataforma web/mobile similar a Netflix o Amazon Prime Video que ofrece
streaming de series y películas.
Para poder acceder hace falta un registro con los datos del usuario. La plataforma
cuenta con un catálogo de series y películas.

Los usuarios premium renuevan su subscripción cada mes, y obtienen como
beneficio acceso a mas contenido, mejor calidad de video y ningún anuncio.
Los usuarios free obtienen una experiencia más limitada, con menos contenido,
menor calidad de video y anuncios.
El staff a cargo de la plataforma tiene acceso a una cuenta premium.

Los usuarios, dejando de lado su tipo de cuenta (premium o free) tienen las
mismas características y deben aportar cierta información básica para registrarse.

La Base de Datos cuenta con las siguientes TABLES:
- user
- subscription
- premium_users
- free_users
- staff
- ads
- movies
- shows

Y las siguientes VIEWS:
- premium_content: lista solo el contenido premium de la plataforma.
- free_content: lista solo el contenido free de la plataforma.
- top_content: lista el contenido con mayor puntuación de la plataforma (premium y free).
- quick_watch: lista contenido de corta duración, "Quick watch". En caso de películas que duren menos de 100 minutos y en las series que duren menos de 30 minutos.
- users_in_debt: lista los usuarios en deuda, que todavía no pagaron.

Se puede acceder al diagrama de entidad relación en el archivo `der.drawio`.
