output "metadata_store_id" {
  description = "The ID of the Vertex AI metadata store"
  value       = google_vertex_ai_metadata_store.store.name
} 