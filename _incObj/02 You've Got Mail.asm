; ---------------------------------------------------------------------------
; Object 02 - mailtime
; ---------------------------------------------------------------------------

mailtime:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	mailtime_Index(pc,d0.w),d1
		jmp	mailtime_Index(pc,d1.w)
; ===========================================================================
mailtime_Index:	dc.w mailtime_Main-mailtime_Index
		dc.w mailtime_Display-mailtime_Index
; ===========================================================================

mailtime_Main:	; Routine 0
		addq.b	#2,obRoutine(a0)
		move.l	#Map_mailtime,obMap(a0)
		ori.b	#4,obRender(a0)
		move.b	#1,obPriority(a0)
		move.b	#$10,obActWid(a0)
		move.w	#make_art_tile(ArtTile_LZ_Splash,2,0),obGfx(a0)
		move.b	#bgm_Stop,d0
		jsr	PlaySound.w

mailtime_Display:	; Routine 2
		moveq	#$FFFFFF90,d0
		jsr	MegaPCM_PlaySample
		jmp	(DisplaySprite).l