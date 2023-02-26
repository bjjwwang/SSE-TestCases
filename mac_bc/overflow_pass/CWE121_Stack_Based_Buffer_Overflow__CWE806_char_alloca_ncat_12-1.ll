; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_12-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_12-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 100, align 16, !dbg !22
  store i8* %0, i8** %dataBuffer, align 8, !dbg !21
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !23
  store i8* %1, i8** %data, align 8, !dbg !24
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.else, !dbg !27

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !28
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !28
  %call1 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !28
  %5 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.else:                                          ; preds = %entry
  %6 = load i8*, i8** %data, align 8, !dbg !33
  %7 = load i8*, i8** %data, align 8, !dbg !33
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !33
  %call2 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 49, i64 noundef %8) #5, !dbg !33
  %9 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 49, !dbg !35
  store i8 0, i8* %arrayidx3, align 1, !dbg !36
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %10 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 50, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !43
  %11 = load i8*, i8** %data, align 8, !dbg !43
  %12 = load i8*, i8** %data, align 8, !dbg !43
  %call4 = call i64 @strlen(i8* noundef %12), !dbg !43
  %call5 = call i8* @__strncat_chk(i8* noundef %arraydecay, i8* noundef %11, i64 noundef %call4, i64 noundef 50) #5, !dbg !43
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !44
  store i8 0, i8* %arrayidx6, align 1, !dbg !45
  %13 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* noundef %13), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__strncat_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_12_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* noundef null), !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 noundef %conv), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_12_good(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_12_bad(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 100, align 16, !dbg !76
  store i8* %0, i8** %dataBuffer, align 8, !dbg !75
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !77
  store i8* %1, i8** %data, align 8, !dbg !78
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !79
  %tobool = icmp ne i32 %call, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !82
  %3 = load i8*, i8** %data, align 8, !dbg !82
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !82
  %call1 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !82
  %5 = load i8*, i8** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %6 = load i8*, i8** %data, align 8, !dbg !87
  %7 = load i8*, i8** %data, align 8, !dbg !87
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !87
  %call2 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 49, i64 noundef %8) #5, !dbg !87
  %9 = load i8*, i8** %data, align 8, !dbg !89
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 49, !dbg !89
  store i8 0, i8* %arrayidx3, align 1, !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !91, metadata !DIExpression()), !dbg !93
  %10 = bitcast [50 x i8]* %dest to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 50, i1 false), !dbg !93
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !94
  %11 = load i8*, i8** %data, align 8, !dbg !94
  %12 = load i8*, i8** %data, align 8, !dbg !94
  %call4 = call i64 @strlen(i8* noundef %12), !dbg !94
  %call5 = call i8* @__strncat_chk(i8* noundef %arraydecay, i8* noundef %11, i64 noundef %call4, i64 noundef 50) #5, !dbg !94
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !95
  store i8 0, i8* %arrayidx6, align 1, !dbg !96
  %13 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* noundef %13), !dbg !98
  ret void, !dbg !99
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_12_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 33, scope: !13)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 10, scope: !13)
!25 = !DILocation(line: 28, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!27 = !DILocation(line: 28, column: 8, scope: !13)
!28 = !DILocation(line: 31, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 29, column: 5)
!30 = !DILocation(line: 32, column: 9, scope: !29)
!31 = !DILocation(line: 32, column: 21, scope: !29)
!32 = !DILocation(line: 33, column: 5, scope: !29)
!33 = !DILocation(line: 37, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !26, file: !14, line: 35, column: 5)
!35 = !DILocation(line: 38, column: 9, scope: !34)
!36 = !DILocation(line: 38, column: 20, scope: !34)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !14, line: 41, type: !39)
!38 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 41, column: 14, scope: !38)
!43 = !DILocation(line: 43, column: 9, scope: !38)
!44 = !DILocation(line: 44, column: 9, scope: !38)
!45 = !DILocation(line: 44, column: 20, scope: !38)
!46 = !DILocation(line: 45, column: 19, scope: !38)
!47 = !DILocation(line: 45, column: 9, scope: !38)
!48 = !DILocation(line: 47, column: 1, scope: !13)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_12_good", scope: !14, file: !14, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!50 = !DILocation(line: 83, column: 5, scope: !49)
!51 = !DILocation(line: 84, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 96, type: !53, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !14, line: 96, type: !55)
!58 = !DILocation(line: 96, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !14, line: 96, type: !56)
!60 = !DILocation(line: 96, column: 27, scope: !52)
!61 = !DILocation(line: 99, column: 22, scope: !52)
!62 = !DILocation(line: 99, column: 12, scope: !52)
!63 = !DILocation(line: 99, column: 5, scope: !52)
!64 = !DILocation(line: 101, column: 5, scope: !52)
!65 = !DILocation(line: 102, column: 5, scope: !52)
!66 = !DILocation(line: 103, column: 5, scope: !52)
!67 = !DILocation(line: 106, column: 5, scope: !52)
!68 = !DILocation(line: 107, column: 5, scope: !52)
!69 = !DILocation(line: 108, column: 5, scope: !52)
!70 = !DILocation(line: 110, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!72 = !DILocalVariable(name: "data", scope: !71, file: !14, line: 57, type: !3)
!73 = !DILocation(line: 57, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !14, line: 58, type: !3)
!75 = !DILocation(line: 58, column: 12, scope: !71)
!76 = !DILocation(line: 58, column: 33, scope: !71)
!77 = !DILocation(line: 59, column: 12, scope: !71)
!78 = !DILocation(line: 59, column: 10, scope: !71)
!79 = !DILocation(line: 60, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !71, file: !14, line: 60, column: 8)
!81 = !DILocation(line: 60, column: 8, scope: !71)
!82 = !DILocation(line: 63, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !14, line: 61, column: 5)
!84 = !DILocation(line: 64, column: 9, scope: !83)
!85 = !DILocation(line: 64, column: 20, scope: !83)
!86 = !DILocation(line: 65, column: 5, scope: !83)
!87 = !DILocation(line: 69, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !80, file: !14, line: 67, column: 5)
!89 = !DILocation(line: 70, column: 9, scope: !88)
!90 = !DILocation(line: 70, column: 20, scope: !88)
!91 = !DILocalVariable(name: "dest", scope: !92, file: !14, line: 73, type: !39)
!92 = distinct !DILexicalBlock(scope: !71, file: !14, line: 72, column: 5)
!93 = !DILocation(line: 73, column: 14, scope: !92)
!94 = !DILocation(line: 75, column: 9, scope: !92)
!95 = !DILocation(line: 76, column: 9, scope: !92)
!96 = !DILocation(line: 76, column: 20, scope: !92)
!97 = !DILocation(line: 77, column: 19, scope: !92)
!98 = !DILocation(line: 77, column: 9, scope: !92)
!99 = !DILocation(line: 79, column: 1, scope: !71)
