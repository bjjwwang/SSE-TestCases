; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_18-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_18-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source1 = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  br label %source, !dbg !29

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !30), !dbg !31
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  %0 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i8]* %source1, metadata !36, metadata !DIExpression()), !dbg !38
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx3, align 1, !dbg !41
  %1 = load i8*, i8** %data, align 8, !dbg !42
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !43
  %call = call i8* @strcat(i8* %1, i8* %arraydecay4) #5, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %2), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_18_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #5, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #5, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_18_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_18_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source1 = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  br label %source, !dbg !77

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !78), !dbg !79
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !80
  store i8* %arraydecay, i8** %data, align 8, !dbg !81
  %0 = load i8*, i8** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i8]* %source1, metadata !84, metadata !DIExpression()), !dbg !86
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !87
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 99, !dbg !88
  store i8 0, i8* %arrayidx3, align 1, !dbg !89
  %1 = load i8*, i8** %data, align 8, !dbg !90
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !91
  %call = call i8* @strcat(i8* %1, i8* %arraydecay4) #5, !dbg !92
  %2 = load i8*, i8** %data, align 8, !dbg !93
  call void @printLine(i8* %2), !dbg !94
  ret void, !dbg !95
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_18-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_18_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_18-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 28, column: 5, scope: !11)
!30 = !DILabel(scope: !11, name: "source", file: !12, line: 29)
!31 = !DILocation(line: 29, column: 1, scope: !11)
!32 = !DILocation(line: 32, column: 12, scope: !11)
!33 = !DILocation(line: 32, column: 10, scope: !11)
!34 = !DILocation(line: 33, column: 5, scope: !11)
!35 = !DILocation(line: 33, column: 13, scope: !11)
!36 = !DILocalVariable(name: "source", scope: !37, file: !12, line: 35, type: !25)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!38 = !DILocation(line: 35, column: 14, scope: !37)
!39 = !DILocation(line: 36, column: 9, scope: !37)
!40 = !DILocation(line: 37, column: 9, scope: !37)
!41 = !DILocation(line: 37, column: 23, scope: !37)
!42 = !DILocation(line: 39, column: 16, scope: !37)
!43 = !DILocation(line: 39, column: 22, scope: !37)
!44 = !DILocation(line: 39, column: 9, scope: !37)
!45 = !DILocation(line: 40, column: 19, scope: !37)
!46 = !DILocation(line: 40, column: 9, scope: !37)
!47 = !DILocation(line: 42, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_18_good", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 71, column: 5, scope: !48)
!50 = !DILocation(line: 72, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 84, type: !52, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 84, type: !54)
!57 = !DILocation(line: 84, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 84, type: !55)
!59 = !DILocation(line: 84, column: 27, scope: !51)
!60 = !DILocation(line: 87, column: 22, scope: !51)
!61 = !DILocation(line: 87, column: 12, scope: !51)
!62 = !DILocation(line: 87, column: 5, scope: !51)
!63 = !DILocation(line: 89, column: 5, scope: !51)
!64 = !DILocation(line: 90, column: 5, scope: !51)
!65 = !DILocation(line: 91, column: 5, scope: !51)
!66 = !DILocation(line: 94, column: 5, scope: !51)
!67 = !DILocation(line: 95, column: 5, scope: !51)
!68 = !DILocation(line: 96, column: 5, scope: !51)
!69 = !DILocation(line: 98, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 51, type: !16)
!72 = !DILocation(line: 51, column: 12, scope: !70)
!73 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !12, line: 52, type: !20)
!74 = !DILocation(line: 52, column: 10, scope: !70)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !12, line: 53, type: !25)
!76 = !DILocation(line: 53, column: 10, scope: !70)
!77 = !DILocation(line: 54, column: 5, scope: !70)
!78 = !DILabel(scope: !70, name: "source", file: !12, line: 55)
!79 = !DILocation(line: 55, column: 1, scope: !70)
!80 = !DILocation(line: 57, column: 12, scope: !70)
!81 = !DILocation(line: 57, column: 10, scope: !70)
!82 = !DILocation(line: 58, column: 5, scope: !70)
!83 = !DILocation(line: 58, column: 13, scope: !70)
!84 = !DILocalVariable(name: "source", scope: !85, file: !12, line: 60, type: !25)
!85 = distinct !DILexicalBlock(scope: !70, file: !12, line: 59, column: 5)
!86 = !DILocation(line: 60, column: 14, scope: !85)
!87 = !DILocation(line: 61, column: 9, scope: !85)
!88 = !DILocation(line: 62, column: 9, scope: !85)
!89 = !DILocation(line: 62, column: 23, scope: !85)
!90 = !DILocation(line: 64, column: 16, scope: !85)
!91 = !DILocation(line: 64, column: 22, scope: !85)
!92 = !DILocation(line: 64, column: 9, scope: !85)
!93 = !DILocation(line: 65, column: 19, scope: !85)
!94 = !DILocation(line: 65, column: 9, scope: !85)
!95 = !DILocation(line: 67, column: 1, scope: !70)
