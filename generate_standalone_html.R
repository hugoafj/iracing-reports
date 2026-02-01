# Script para generar HTML autocontenido con datos embebidos
# Ejecutar después de analyze_race_pace.R

library(jsonlite)

message("🌐 Generando HTML autocontenido...")

# Leer JSONs
global_json <- fromJSON("data/global_standings.json")
session_json <- fromJSON("data/session_standings.json")
stints_json <- fromJSON("data/detailed_stints.json")
metadata_json <- fromJSON("data/metadata.json")

# Leer template HTML
html_template <- readLines("index.html", warn = FALSE)

# Encontrar línea donde insertar datos
insert_line <- grep("let globalData = \\[\\];", html_template)

if (length(insert_line) > 0) {
  # Crear nuevas líneas con datos embebidos
  data_lines <- c(
    paste0("        let globalData = ", toJSON(global_json, auto_unbox = TRUE), ";"),
    paste0("        let sessionData = ", toJSON(session_json, auto_unbox = FALSE), ";"),
    paste0("        let stintsData = ", toJSON(stints_json, auto_unbox = TRUE), ";"),
    paste0("        let metadata = ", toJSON(metadata_json, auto_unbox = TRUE), ";")
  )
  
  # Reemplazar líneas
  html_output <- c(
    html_template[1:(insert_line-1)],
    data_lines,
    html_template[(insert_line+4):length(html_template)]
  )
  
  # Comentar la función loadData() ya que los datos están embebidos
  html_output <- gsub("async function loadData", "async function loadData_disabled", html_output)
  html_output <- gsub("await loadData\\(\\);", "// Datos embebidos - loadData deshabilitado", html_output)
  
  # Buscar la línea antes de </script> para agregar inicialización
  script_end <- grep("</script>", html_output)
  script_end <- script_end[length(script_end)]  # Último </script>
  
  # Agregar código de inicialización
  init_code <- c(
    "",
    "        // Inicializar al cargar la página",
    "        (function() {",
    "            updateStatsSummary();",
    "            setupEventListeners();",
    "            renderTable();",
    "            document.getElementById('loading').classList.add('hidden');",
    "            document.getElementById('table-content').classList.remove('hidden');",
    "        })();"
  )
  
  # Insertar código de inicialización antes de </script>
  html_output <- c(
    html_output[1:(script_end-1)],
    init_code,
    html_output[script_end:length(html_output)]
  )
  
  # Guardar HTML autocontenido
  writeLines(html_output, "index_standalone.html", useBytes = TRUE)
  
  message("✅ HTML autocontenido creado: index_standalone.html")
  message("   📁 Puedes abrir este archivo directamente en el navegador")
  message("   📂 No requiere servidor HTTP local\n")
} else {
  message("❌ No se pudo encontrar la línea de inserción en index.html")
}
