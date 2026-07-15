from sqlalchemy import Integer, Text, DateTime, Float, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship
from config.database import Base
from datetime import datetime
from zoneinfo import ZoneInfo

class EmergencyAlert(Base):
    __tablename__ = "emergency_alerts"

    id: Mapped[int] = mapped_column(Integer, autoincrement=True, primary_key=True)
    user_id: Mapped[int] = mapped_column(Integer, ForeignKey("users.id"), nullable=False)
    latitude: Mapped[float] = mapped_column(Float, nullable=False)
    longitude: Mapped[float] = mapped_column(Float, nullable=False)
    description: Mapped[str] = mapped_column(Text, nullable=True)
    device_name: Mapped[str] = mapped_column(Text, nullable=True)
    status: Mapped[str] = mapped_column(Text, default="active", nullable=False)
    created_at: Mapped[datetime] = mapped_column(DateTime, default=datetime.now(ZoneInfo("America/La_Paz")))
    updated_at: Mapped[datetime] = mapped_column(DateTime, default=datetime.now(ZoneInfo("America/La_Paz")), onupdate=datetime.now(ZoneInfo("America/La_Paz")))
    
    # Relaciones
    user = relationship("User", back_populates="emergency_alerts")
