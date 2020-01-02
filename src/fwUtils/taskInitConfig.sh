if [ -f "${BX_APP_CONFIG_FILE}" ]; then
  @log.warn "Configuration file '$(@style bold color:blue)${BX_APP_CONFIG_FILE}$(@style default)' already exists!"
else
  touch "${BX_APP_CONFIG_FILE}" || @app.error "Can not create file '$(@style bold color:blue)${BX_APP_CONFIG_FILE}$(@style default)'"
  @log "Configuration file '$(@style bold color:blue)${BX_APP_CONFIG_FILE}$(@style default)' $(@style bold color:green)added$(@style default)!"
fi

@app.exit
