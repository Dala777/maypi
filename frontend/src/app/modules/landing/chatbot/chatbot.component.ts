import { Component, type OnInit, ViewEncapsulation, inject } from "@angular/core"
import { CommonModule } from "@angular/common"
import { FormsModule } from "@angular/forms"
import { MatButtonModule } from "@angular/material/button"
import { MatIconModule } from "@angular/material/icon"
import { MatInputModule } from "@angular/material/input"
import { MatFormFieldModule } from "@angular/material/form-field"
import { trigger, transition, style, animate } from "@angular/animations"
import { HttpClient, HttpHeaders } from "@angular/common/http"

interface Message {
  content: string
  isUser: boolean
  timestamp: Date
}

@Component({
  selector: "app-chatbot",
  templateUrl: "./chatbot.component.html",
  encapsulation: ViewEncapsulation.None,
  standalone: true,
  imports: [CommonModule, FormsModule, MatButtonModule, MatIconModule, MatInputModule, MatFormFieldModule],
  animations: [
    trigger("fadeIn", [
      transition(":enter", [
        style({ opacity: 0, transform: "translateY(10px)" }),
        animate("300ms ease-out", style({ opacity: 1, transform: "translateY(0)" })),
      ]),
    ]),
    trigger("slideIn", [
      transition(":enter", [
        style({ transform: "translateY(100%)" }),
        animate("300ms ease-out", style({ transform: "translateY(0)" })),
      ]),
      transition(":leave", [animate("300ms ease-in", style({ transform: "translateY(100%)" }))]),
    ]),
  ],
})
export class ChatbotComponent implements OnInit {
  private http = inject(HttpClient)

  isOpen = false
  userMessage = ""
  messages: Message[] = []
  isTyping = false

  private readonly API_CONFIG = {
    groq: {
      url: "https://api.groq.com/openai/v1/chat/completions",
      key: "", // Set via environment variable: GROQ_API_KEY
      model: "llama3-8b-8192",
    },
  }

  private readonly SYSTEM_PROMPT =
    `Eres Nuna, el asistente virtual de Maypi, una plataforma boliviana dedicada a ayudar a encontrar personas desaparecidas. 

Tu misión es:
- Ayudar a las familias con información sobre cómo reportar desapariciones
- Proporcionar orientación sobre búsqueda de personas
- Conectar a las personas con recursos y autoridades
- Brindar apoyo emocional con empatía
- Responder solo sobre temas relacionados con personas desaparecidas y Maypi

Información clave de Maypi:
- Línea de emergencia: 800-123-456 (24/7)
- Oficina: Av. Principal #123, La Paz, Bolivia
- Colaboramos con Policía Boliviana
- Horario: Lunes a Viernes 8:00-20:00, Sábados 9:00-14:00

Responde de manera empática, profesional y en español. Mantén las respuestas concisas (máximo 200 palabras). Si te preguntan sobre otros temas, redirige amablemente hacia los servicios de Maypi.`

  ngOnInit(): void {
    setTimeout(() => {
      this.addBotMessage("¡Hola! Soy Nuna, tu asistente virtual de Maypi 👋")

      setTimeout(() => {
        this.addBotMessage(
          "Estoy aquí para ayudarte con información sobre personas desaparecidas en Bolivia. ¿En qué puedo asistirte?",
        )
      }, 1000)

      setTimeout(() => {
        this.addBotMessage(
          "Puedes preguntarme sobre:\n• Cómo reportar una desaparición\n• Buscar personas desaparecidas\n• Contactar autoridades\n• Recursos de apoyo",
        )
      }, 2000)
    }, 500)
  }

  toggleChat(): void {
    this.isOpen = !this.isOpen
  }

  async sendMessage(): Promise<void> {
    if (!this.userMessage.trim()) return

    this.addUserMessage(this.userMessage)
    const userQuery = this.userMessage
    this.userMessage = ""

    this.isTyping = true

    try {
      const response = await this.callAI(userQuery)
      this.isTyping = false
      this.addBotMessage(response)
    } catch (error) {
      this.isTyping = false
      console.error("Error al conectar con la IA:", error)

      this.addBotMessage("🔄 Disculpa, tengo problemas de conexión. Te ayudo con información básica:")

      //respuesta de respaldo
      setTimeout(() => {
        const fallbackResponse = this.getFallbackResponse(userQuery)
        this.addBotMessage(fallbackResponse)
      }, 500)
    }
  }

  private async callAI(message: string): Promise<string> {
    const headers = new HttpHeaders({
      Authorization: `Bearer ${this.API_CONFIG.groq.key}`,
      "Content-Type": "application/json",
    })

    const body = {
      messages: [
        {
          role: "system",
          content: this.SYSTEM_PROMPT,
        },
        {
          role: "user",
          content: message,
        },
      ],
      model: this.API_CONFIG.groq.model,
      temperature: 0.7,
      max_tokens: 200, //reducido para respuestas concisas
      top_p: 1,
      stream: false,
    }

    const response = await this.http.post<any>(this.API_CONFIG.groq.url, body, { headers }).toPromise()

    if (response?.choices?.[0]?.message?.content) {
      return response.choices[0].message.content.trim()
    } else {
      throw new Error("Respuesta inválida de la API")
    }
  }

  private getFallbackResponse(query: string): string {
    const lowerQuery = query.toLowerCase()

    if (lowerQuery.includes("hola") || lowerQuery.includes("buenos") || lowerQuery.includes("buenas")) {
      return "¡Hola! 👋 Soy Nuna, tu asistente de Maypi. Estoy aquí para ayudarte con información sobre personas desaparecidas. ¿En qué puedo asistirte?"
    }

    if (lowerQuery.includes("reportar") || lowerQuery.includes("denuncia") || lowerQuery.includes("desaparecido")) {
      return '📋 **Para reportar una desaparición:**\n\n🚨 **URGENTE:** Llama al 800-123-456 (24/7)\n📝 Ve a "Reportar Desaparición" en nuestra web\n👮‍♂️ Contacta también a la Policía Boliviana\n\n⏰ **Importante:** Las primeras 24 horas son críticas.'
    }

    if (lowerQuery.includes("buscar") || lowerQuery.includes("encontrar") || lowerQuery.includes("persona")) {
      return '🔍 **Para buscar personas desaparecidas:**\n\n• Visita "Buscar Personas" en nuestra web\n• Revisa casos recientes y urgentes\n• Comparte en redes sociales\n• Llama al 800-123-456 si tienes información\n\n👥 Tu ayuda puede reunir familias.'
    }

    if (lowerQuery.includes("contacto") || lowerQuery.includes("teléfono") || lowerQuery.includes("llamar")) {
      return "📞 **Información de contacto:**\n\n🚨 **Emergencias:** 800-123-456 (24/7)\n🏢 **Oficina:** Av. Principal #123, La Paz\n⏰ **Horario:** Lun-Vie 8:00-20:00, Sáb 9:00-14:00\n\n🤝 Colaboramos con Policía Boliviana, Interpol y Cruz Roja."
    }

    if (lowerQuery.includes("ayuda") || lowerQuery.includes("apoyo") || lowerQuery.includes("necesito")) {
      return "💙 **Estamos aquí para apoyarte:**\n\n• Orientación para reportar casos\n• Conexión con autoridades\n• Recursos para familias\n• Apoyo emocional\n\n🤗 No estás solo/a. Llama al 800-123-456 para ayuda inmediata."
    }

    if (lowerQuery.includes("gracias") || lowerQuery.includes("thank")) {
      return "😊 ¡De nada! Es un honor ayudarte. Si necesitas más información o tienes una emergencia, no dudes en llamar al 800-123-456. Estamos aquí 24/7 para apoyarte. 💙"
    }

    // Respuesta por defecto más útil
    return "🤖 **Como asistente de Maypi, puedo ayudarte con:**\n\n📋 Reportar desapariciones\n🔍 Buscar personas\n📞 Contactar autoridades\n💙 Recursos de apoyo\n\n**¿Sobre qué tema necesitas información?**\n\n🚨 Para emergencias: **800-123-456** (24/7)"
  }

  private addUserMessage(content: string): void {
    this.messages.push({
      content,
      isUser: true,
      timestamp: new Date(),
    })
    this.scrollToBottom()
  }

  private addBotMessage(content: string): void {
    this.messages.push({
      content,
      isUser: false,
      timestamp: new Date(),
    })
    this.scrollToBottom()
  }

  private scrollToBottom(): void {
    setTimeout(() => {
      const chatBody = document.querySelector(".overflow-y-auto")
      if (chatBody) {
        chatBody.scrollTop = chatBody.scrollHeight
      }
    }, 100)
  }
}
