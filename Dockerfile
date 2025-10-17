# Odoo 17
FROM odoo:17

# نحتاج root عشان النسخ وتعديل التصاريح
USER root

# انسخي الإضافة كلها (لأن الريبو جذرُه إضافة)
COPY . /mnt/extra-addons/graduation

# تصاريح
RUN chown -R odoo:odoo /mnt/extra-addons

# ارجعي لمستخدم odoo
USER odoo

# مسار الإضافات
ENV ADDONS_PATH=/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons

# (Render بيعطي PORT ديناميكي) لازم نستخدمه مع Odoo
# ملاحظة: EXPOSE اختياري هون، الأهم إننا نشغّل Odoo على ${PORT}
CMD ["odoo",
     "-d","${DB_NAME}",
     "--db_host","${DB_HOST}",
     "--db_port","${DB_PORT}",
     "--db_user","${DB_USER}",
     "--db_password","${DB_PASSWORD}",
     "--addons-path","/usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons",
     "--http-port","${PORT}"
]
