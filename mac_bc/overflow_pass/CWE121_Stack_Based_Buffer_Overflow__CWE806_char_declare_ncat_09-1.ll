; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_09-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_09-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_TRUE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_09_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !25
  store i8* %arraydecay, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !30
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #5, !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %6 = load i8*, i8** %data, align 8, !dbg !41
  %7 = load i8*, i8** %data, align 8, !dbg !41
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !41
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef %call2, i64 noundef 50) #5, !dbg !41
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !42
  store i8 0, i8* %arrayidx4, align 1, !dbg !43
  %8 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* noundef %8), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strncat_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_09_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* noundef null), !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 noundef %conv), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_09_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_09_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !75
  store i8* %arraydecay, i8** %data, align 8, !dbg !76
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !77
  %tobool = icmp ne i32 %0, 0, !dbg !77
  br i1 %tobool, label %if.then, label %if.else, !dbg !79

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !80
  br label %if.end, !dbg !82

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !83
  %2 = load i8*, i8** %data, align 8, !dbg !83
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !83
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !83
  %4 = load i8*, i8** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !87, metadata !DIExpression()), !dbg !89
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !89
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !90
  %6 = load i8*, i8** %data, align 8, !dbg !90
  %7 = load i8*, i8** %data, align 8, !dbg !90
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !90
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef %call2, i64 noundef 50) #5, !dbg !90
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !91
  store i8 0, i8* %arrayidx4, align 1, !dbg !92
  %8 = load i8*, i8** %data, align 8, !dbg !93
  call void @printLine(i8* noundef %8), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !101
  store i8* %arraydecay, i8** %data, align 8, !dbg !102
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !103
  %tobool = icmp ne i32 %0, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !106
  %2 = load i8*, i8** %data, align 8, !dbg !106
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !106
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !106
  %4 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  br label %if.end, !dbg !110

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !113
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !114
  %6 = load i8*, i8** %data, align 8, !dbg !114
  %7 = load i8*, i8** %data, align 8, !dbg !114
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !114
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay1, i8* noundef %6, i64 noundef %call2, i64 noundef 50) #5, !dbg !114
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !115
  store i8 0, i8* %arrayidx4, align 1, !dbg !116
  %8 = load i8*, i8** %data, align 8, !dbg !117
  call void @printLine(i8* noundef %8), !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_09_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocation(line: 27, column: 12, scope: !11)
!26 = !DILocation(line: 27, column: 10, scope: !11)
!27 = !DILocation(line: 28, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!29 = !DILocation(line: 28, column: 8, scope: !11)
!30 = !DILocation(line: 31, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !12, line: 29, column: 5)
!32 = !DILocation(line: 32, column: 9, scope: !31)
!33 = !DILocation(line: 32, column: 21, scope: !31)
!34 = !DILocation(line: 33, column: 5, scope: !31)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 35, column: 14, scope: !36)
!41 = !DILocation(line: 37, column: 9, scope: !36)
!42 = !DILocation(line: 38, column: 9, scope: !36)
!43 = !DILocation(line: 38, column: 20, scope: !36)
!44 = !DILocation(line: 39, column: 19, scope: !36)
!45 = !DILocation(line: 39, column: 9, scope: !36)
!46 = !DILocation(line: 41, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_09_good", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!48 = !DILocation(line: 96, column: 5, scope: !47)
!49 = !DILocation(line: 97, column: 5, scope: !47)
!50 = !DILocation(line: 98, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 110, type: !52, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 110, type: !54)
!57 = !DILocation(line: 110, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 110, type: !55)
!59 = !DILocation(line: 110, column: 27, scope: !51)
!60 = !DILocation(line: 113, column: 22, scope: !51)
!61 = !DILocation(line: 113, column: 12, scope: !51)
!62 = !DILocation(line: 113, column: 5, scope: !51)
!63 = !DILocation(line: 115, column: 5, scope: !51)
!64 = !DILocation(line: 116, column: 5, scope: !51)
!65 = !DILocation(line: 117, column: 5, scope: !51)
!66 = !DILocation(line: 120, column: 5, scope: !51)
!67 = !DILocation(line: 121, column: 5, scope: !51)
!68 = !DILocation(line: 122, column: 5, scope: !51)
!69 = !DILocation(line: 124, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 50, type: !17)
!72 = !DILocation(line: 50, column: 12, scope: !70)
!73 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !12, line: 51, type: !21)
!74 = !DILocation(line: 51, column: 10, scope: !70)
!75 = !DILocation(line: 52, column: 12, scope: !70)
!76 = !DILocation(line: 52, column: 10, scope: !70)
!77 = !DILocation(line: 53, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !70, file: !12, line: 53, column: 8)
!79 = !DILocation(line: 53, column: 8, scope: !70)
!80 = !DILocation(line: 56, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !12, line: 54, column: 5)
!82 = !DILocation(line: 57, column: 5, scope: !81)
!83 = !DILocation(line: 61, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !12, line: 59, column: 5)
!85 = !DILocation(line: 62, column: 9, scope: !84)
!86 = !DILocation(line: 62, column: 20, scope: !84)
!87 = !DILocalVariable(name: "dest", scope: !88, file: !12, line: 65, type: !37)
!88 = distinct !DILexicalBlock(scope: !70, file: !12, line: 64, column: 5)
!89 = !DILocation(line: 65, column: 14, scope: !88)
!90 = !DILocation(line: 67, column: 9, scope: !88)
!91 = !DILocation(line: 68, column: 9, scope: !88)
!92 = !DILocation(line: 68, column: 20, scope: !88)
!93 = !DILocation(line: 69, column: 19, scope: !88)
!94 = !DILocation(line: 69, column: 9, scope: !88)
!95 = !DILocation(line: 71, column: 1, scope: !70)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 76, type: !17)
!98 = !DILocation(line: 76, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !12, line: 77, type: !21)
!100 = !DILocation(line: 77, column: 10, scope: !96)
!101 = !DILocation(line: 78, column: 12, scope: !96)
!102 = !DILocation(line: 78, column: 10, scope: !96)
!103 = !DILocation(line: 79, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !12, line: 79, column: 8)
!105 = !DILocation(line: 79, column: 8, scope: !96)
!106 = !DILocation(line: 82, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !12, line: 80, column: 5)
!108 = !DILocation(line: 83, column: 9, scope: !107)
!109 = !DILocation(line: 83, column: 20, scope: !107)
!110 = !DILocation(line: 84, column: 5, scope: !107)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !12, line: 86, type: !37)
!112 = distinct !DILexicalBlock(scope: !96, file: !12, line: 85, column: 5)
!113 = !DILocation(line: 86, column: 14, scope: !112)
!114 = !DILocation(line: 88, column: 9, scope: !112)
!115 = !DILocation(line: 89, column: 9, scope: !112)
!116 = !DILocation(line: 89, column: 20, scope: !112)
!117 = !DILocation(line: 90, column: 19, scope: !112)
!118 = !DILocation(line: 90, column: 9, scope: !112)
!119 = !DILocation(line: 92, column: 1, scope: !96)
