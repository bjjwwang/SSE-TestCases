; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_01-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_01-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_01_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !33, metadata !DIExpression()), !dbg !35
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_01_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !37
  %call = call i8* @strcpy(i8* %2, i8* %arraydecay1) #5, !dbg !38
  %3 = load i8*, i8** %data, align 8, !dbg !39
  call void @printLine(i8* %3), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_01_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #5, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #5, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_01_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_01_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !71
  store i8* %arraydecay, i8** %data, align 8, !dbg !72
  %0 = load i8*, i8** %data, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !75, metadata !DIExpression()), !dbg !77
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !77
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !77
  %2 = load i8*, i8** %data, align 8, !dbg !78
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !79
  %call = call i8* @strcpy(i8* %2, i8* %arraydecay1) #5, !dbg !80
  %3 = load i8*, i8** %data, align 8, !dbg !81
  call void @printLine(i8* %3), !dbg !82
  ret void, !dbg !83
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_01_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 30, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 31, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 32, column: 10, scope: !11)
!29 = !DILocation(line: 35, column: 12, scope: !11)
!30 = !DILocation(line: 35, column: 10, scope: !11)
!31 = !DILocation(line: 36, column: 5, scope: !11)
!32 = !DILocation(line: 36, column: 13, scope: !11)
!33 = !DILocalVariable(name: "source", scope: !34, file: !12, line: 38, type: !25)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!35 = !DILocation(line: 38, column: 14, scope: !34)
!36 = !DILocation(line: 40, column: 16, scope: !34)
!37 = !DILocation(line: 40, column: 22, scope: !34)
!38 = !DILocation(line: 40, column: 9, scope: !34)
!39 = !DILocation(line: 41, column: 19, scope: !34)
!40 = !DILocation(line: 41, column: 9, scope: !34)
!41 = !DILocation(line: 43, column: 1, scope: !11)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_01_good", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 69, column: 5, scope: !42)
!44 = !DILocation(line: 70, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !46, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !12, line: 82, type: !48)
!51 = !DILocation(line: 82, column: 14, scope: !45)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !12, line: 82, type: !49)
!53 = !DILocation(line: 82, column: 27, scope: !45)
!54 = !DILocation(line: 85, column: 22, scope: !45)
!55 = !DILocation(line: 85, column: 12, scope: !45)
!56 = !DILocation(line: 85, column: 5, scope: !45)
!57 = !DILocation(line: 87, column: 5, scope: !45)
!58 = !DILocation(line: 88, column: 5, scope: !45)
!59 = !DILocation(line: 89, column: 5, scope: !45)
!60 = !DILocation(line: 92, column: 5, scope: !45)
!61 = !DILocation(line: 93, column: 5, scope: !45)
!62 = !DILocation(line: 94, column: 5, scope: !45)
!63 = !DILocation(line: 96, column: 5, scope: !45)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !12, line: 52, type: !16)
!66 = !DILocation(line: 52, column: 12, scope: !64)
!67 = !DILocalVariable(name: "dataBadBuffer", scope: !64, file: !12, line: 53, type: !20)
!68 = !DILocation(line: 53, column: 10, scope: !64)
!69 = !DILocalVariable(name: "dataGoodBuffer", scope: !64, file: !12, line: 54, type: !25)
!70 = !DILocation(line: 54, column: 10, scope: !64)
!71 = !DILocation(line: 57, column: 12, scope: !64)
!72 = !DILocation(line: 57, column: 10, scope: !64)
!73 = !DILocation(line: 58, column: 5, scope: !64)
!74 = !DILocation(line: 58, column: 13, scope: !64)
!75 = !DILocalVariable(name: "source", scope: !76, file: !12, line: 60, type: !25)
!76 = distinct !DILexicalBlock(scope: !64, file: !12, line: 59, column: 5)
!77 = !DILocation(line: 60, column: 14, scope: !76)
!78 = !DILocation(line: 62, column: 16, scope: !76)
!79 = !DILocation(line: 62, column: 22, scope: !76)
!80 = !DILocation(line: 62, column: 9, scope: !76)
!81 = !DILocation(line: 63, column: 19, scope: !76)
!82 = !DILocation(line: 63, column: 9, scope: !76)
!83 = !DILocation(line: 65, column: 1, scope: !64)
