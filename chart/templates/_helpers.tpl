{{/* Generate a fullname for resources */}}
{{- define "demo-app.fullname" -}}
{{- printf "%s-%s" .Release.Name "demo-app" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Generate a name for resources */}}
{{- define "demo-app.name" -}}
{{- printf "demo-app" -}}
{{- end -}}
