; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_badSink(i8* noundef %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !25
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !25
  %1 = load i8*, i8** %data.addr, align 8, !dbg !26
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !26
  %2 = load i8*, i8** %data.addr, align 8, !dbg !26
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !26
  %call = call i8* @__strcpy_chk(i8* noundef %1, i8* noundef %arraydecay, i64 noundef %3) #5, !dbg !26
  %4 = load i8*, i8** %data.addr, align 8, !dbg !27
  call void @printLine(i8* noundef %4), !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_bad() #0 !dbg !30 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !40, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i8* %arraydecay, i8** %data, align 8, !dbg !43
  %0 = load i8*, i8** %data, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !44
  store i8 0, i8* %arrayidx, align 1, !dbg !45
  %1 = load i8*, i8** %data, align 8, !dbg !46
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_badSink(i8* noundef %1), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_goodG2BSink(i8* noundef %data) #0 !dbg !49 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !52, metadata !DIExpression()), !dbg !54
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !54
  %1 = load i8*, i8** %data.addr, align 8, !dbg !55
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !55
  %2 = load i8*, i8** %data.addr, align 8, !dbg !55
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !55
  %call = call i8* @__strcpy_chk(i8* noundef %1, i8* noundef %arraydecay, i64 noundef %3) #5, !dbg !55
  %4 = load i8*, i8** %data.addr, align 8, !dbg !56
  call void @printLine(i8* noundef %4), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* noundef null), !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 noundef %conv), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_bad(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !88
  store i8* %arraydecay, i8** %data, align 8, !dbg !89
  %0 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  %1 = load i8*, i8** %data, align 8, !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_goodG2BSink(i8* noundef %1), !dbg !93
  ret void, !dbg !94
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_badSink", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 28, type: !15)
!19 = !DILocation(line: 28, column: 84, scope: !11)
!20 = !DILocalVariable(name: "source", scope: !21, file: !12, line: 31, type: !22)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 88, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 11)
!25 = !DILocation(line: 31, column: 14, scope: !21)
!26 = !DILocation(line: 33, column: 9, scope: !21)
!27 = !DILocation(line: 34, column: 19, scope: !21)
!28 = !DILocation(line: 34, column: 9, scope: !21)
!29 = !DILocation(line: 36, column: 1, scope: !11)
!30 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_bad", scope: !12, file: !12, line: 38, type: !31, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !DILocalVariable(name: "data", scope: !30, file: !12, line: 40, type: !15)
!34 = !DILocation(line: 40, column: 12, scope: !30)
!35 = !DILocalVariable(name: "dataBadBuffer", scope: !30, file: !12, line: 41, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 80, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 10)
!39 = !DILocation(line: 41, column: 10, scope: !30)
!40 = !DILocalVariable(name: "dataGoodBuffer", scope: !30, file: !12, line: 42, type: !22)
!41 = !DILocation(line: 42, column: 10, scope: !30)
!42 = !DILocation(line: 45, column: 12, scope: !30)
!43 = !DILocation(line: 45, column: 10, scope: !30)
!44 = !DILocation(line: 46, column: 5, scope: !30)
!45 = !DILocation(line: 46, column: 13, scope: !30)
!46 = !DILocation(line: 47, column: 76, scope: !30)
!47 = !DILocation(line: 47, column: 5, scope: !30)
!48 = !DILocation(line: 48, column: 1, scope: !30)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_goodG2BSink", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!50 = !DILocalVariable(name: "data", arg: 1, scope: !49, file: !12, line: 54, type: !15)
!51 = !DILocation(line: 54, column: 88, scope: !49)
!52 = !DILocalVariable(name: "source", scope: !53, file: !12, line: 57, type: !22)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 56, column: 5)
!54 = !DILocation(line: 57, column: 14, scope: !53)
!55 = !DILocation(line: 59, column: 9, scope: !53)
!56 = !DILocation(line: 60, column: 19, scope: !53)
!57 = !DILocation(line: 60, column: 9, scope: !53)
!58 = !DILocation(line: 62, column: 1, scope: !49)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_cpy_41_good", scope: !12, file: !12, line: 77, type: !31, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!60 = !DILocation(line: 79, column: 5, scope: !59)
!61 = !DILocation(line: 80, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !63, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 92, type: !65)
!68 = !DILocation(line: 92, column: 14, scope: !62)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 92, type: !66)
!70 = !DILocation(line: 92, column: 27, scope: !62)
!71 = !DILocation(line: 95, column: 22, scope: !62)
!72 = !DILocation(line: 95, column: 12, scope: !62)
!73 = !DILocation(line: 95, column: 5, scope: !62)
!74 = !DILocation(line: 97, column: 5, scope: !62)
!75 = !DILocation(line: 98, column: 5, scope: !62)
!76 = !DILocation(line: 99, column: 5, scope: !62)
!77 = !DILocation(line: 102, column: 5, scope: !62)
!78 = !DILocation(line: 103, column: 5, scope: !62)
!79 = !DILocation(line: 104, column: 5, scope: !62)
!80 = !DILocation(line: 106, column: 5, scope: !62)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 65, type: !31, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 67, type: !15)
!83 = !DILocation(line: 67, column: 12, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !12, line: 68, type: !36)
!85 = !DILocation(line: 68, column: 10, scope: !81)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !12, line: 69, type: !22)
!87 = !DILocation(line: 69, column: 10, scope: !81)
!88 = !DILocation(line: 72, column: 12, scope: !81)
!89 = !DILocation(line: 72, column: 10, scope: !81)
!90 = !DILocation(line: 73, column: 5, scope: !81)
!91 = !DILocation(line: 73, column: 13, scope: !81)
!92 = !DILocation(line: 74, column: 80, scope: !81)
!93 = !DILocation(line: 74, column: 5, scope: !81)
!94 = !DILocation(line: 75, column: 1, scope: !81)
