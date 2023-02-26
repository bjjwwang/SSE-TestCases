; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_10-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_10-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalTrue = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_10_bad() #0 !dbg !13 {
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
  %2 = load i32, i32* @globalTrue, align 4, !dbg !25
  %tobool = icmp ne i32 %2, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %4 = load i8*, i8** %data, align 8, !dbg !28
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !28
  %call = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 99, i64 noundef %5) #5, !dbg !28
  %6 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !39
  %8 = load i8*, i8** %data, align 8, !dbg !39
  %9 = load i8*, i8** %data, align 8, !dbg !39
  %call1 = call i64 @strlen(i8* noundef %9), !dbg !39
  %mul = mul i64 %call1, 1, !dbg !39
  %call2 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef %mul, i64 noundef 50) #5, !dbg !39
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !40
  store i8 0, i8* %arrayidx3, align 1, !dbg !41
  %10 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* noundef %10), !dbg !43
  ret void, !dbg !44
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
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_10_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* noundef null), !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 noundef %conv), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_10_good(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_10_bad(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !68 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = alloca i8, i64 100, align 16, !dbg !73
  store i8* %0, i8** %dataBuffer, align 8, !dbg !72
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  store i8* %1, i8** %data, align 8, !dbg !75
  %2 = load i32, i32* @globalFalse, align 4, !dbg !76
  %tobool = icmp ne i32 %2, 0, !dbg !76
  br i1 %tobool, label %if.then, label %if.else, !dbg !78

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  br label %if.end, !dbg !81

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !82
  %4 = load i8*, i8** %data, align 8, !dbg !82
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !82
  %call = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 49, i64 noundef %5) #5, !dbg !82
  %6 = load i8*, i8** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 49, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !86, metadata !DIExpression()), !dbg !88
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !88
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !89
  %8 = load i8*, i8** %data, align 8, !dbg !89
  %9 = load i8*, i8** %data, align 8, !dbg !89
  %call1 = call i64 @strlen(i8* noundef %9), !dbg !89
  %mul = mul i64 %call1, 1, !dbg !89
  %call2 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef %mul, i64 noundef 50) #5, !dbg !89
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !90
  store i8 0, i8* %arrayidx3, align 1, !dbg !91
  %10 = load i8*, i8** %data, align 8, !dbg !92
  call void @printLine(i8* noundef %10), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 100, align 16, !dbg !100
  store i8* %0, i8** %dataBuffer, align 8, !dbg !99
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !101
  store i8* %1, i8** %data, align 8, !dbg !102
  %2 = load i32, i32* @globalTrue, align 4, !dbg !103
  %tobool = icmp ne i32 %2, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !106
  %4 = load i8*, i8** %data, align 8, !dbg !106
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !106
  %call = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 49, i64 noundef %5) #5, !dbg !106
  %6 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 49, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  br label %if.end, !dbg !110

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !113
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !114
  %8 = load i8*, i8** %data, align 8, !dbg !114
  %9 = load i8*, i8** %data, align 8, !dbg !114
  %call1 = call i64 @strlen(i8* noundef %9), !dbg !114
  %mul = mul i64 %call1, 1, !dbg !114
  %call2 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef %mul, i64 noundef 50) #5, !dbg !114
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !115
  store i8 0, i8* %arrayidx3, align 1, !dbg !116
  %10 = load i8*, i8** %data, align 8, !dbg !117
  call void @printLine(i8* noundef %10), !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_10_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!33 = !DILocalVariable(name: "dest", scope: !34, file: !14, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 35, column: 14, scope: !34)
!39 = !DILocation(line: 37, column: 9, scope: !34)
!40 = !DILocation(line: 38, column: 9, scope: !34)
!41 = !DILocation(line: 38, column: 20, scope: !34)
!42 = !DILocation(line: 39, column: 19, scope: !34)
!43 = !DILocation(line: 39, column: 9, scope: !34)
!44 = !DILocation(line: 41, column: 1, scope: !13)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_10_good", scope: !14, file: !14, line: 94, type: !15, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!46 = !DILocation(line: 96, column: 5, scope: !45)
!47 = !DILocation(line: 97, column: 5, scope: !45)
!48 = !DILocation(line: 98, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 110, type: !50, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !14, line: 110, type: !52)
!55 = !DILocation(line: 110, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !14, line: 110, type: !53)
!57 = !DILocation(line: 110, column: 27, scope: !49)
!58 = !DILocation(line: 113, column: 22, scope: !49)
!59 = !DILocation(line: 113, column: 12, scope: !49)
!60 = !DILocation(line: 113, column: 5, scope: !49)
!61 = !DILocation(line: 115, column: 5, scope: !49)
!62 = !DILocation(line: 116, column: 5, scope: !49)
!63 = !DILocation(line: 117, column: 5, scope: !49)
!64 = !DILocation(line: 120, column: 5, scope: !49)
!65 = !DILocation(line: 121, column: 5, scope: !49)
!66 = !DILocation(line: 122, column: 5, scope: !49)
!67 = !DILocation(line: 124, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!69 = !DILocalVariable(name: "data", scope: !68, file: !14, line: 50, type: !3)
!70 = !DILocation(line: 50, column: 12, scope: !68)
!71 = !DILocalVariable(name: "dataBuffer", scope: !68, file: !14, line: 51, type: !3)
!72 = !DILocation(line: 51, column: 12, scope: !68)
!73 = !DILocation(line: 51, column: 33, scope: !68)
!74 = !DILocation(line: 52, column: 12, scope: !68)
!75 = !DILocation(line: 52, column: 10, scope: !68)
!76 = !DILocation(line: 53, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !68, file: !14, line: 53, column: 8)
!78 = !DILocation(line: 53, column: 8, scope: !68)
!79 = !DILocation(line: 56, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !14, line: 54, column: 5)
!81 = !DILocation(line: 57, column: 5, scope: !80)
!82 = !DILocation(line: 61, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !14, line: 59, column: 5)
!84 = !DILocation(line: 62, column: 9, scope: !83)
!85 = !DILocation(line: 62, column: 20, scope: !83)
!86 = !DILocalVariable(name: "dest", scope: !87, file: !14, line: 65, type: !35)
!87 = distinct !DILexicalBlock(scope: !68, file: !14, line: 64, column: 5)
!88 = !DILocation(line: 65, column: 14, scope: !87)
!89 = !DILocation(line: 67, column: 9, scope: !87)
!90 = !DILocation(line: 68, column: 9, scope: !87)
!91 = !DILocation(line: 68, column: 20, scope: !87)
!92 = !DILocation(line: 69, column: 19, scope: !87)
!93 = !DILocation(line: 69, column: 9, scope: !87)
!94 = !DILocation(line: 71, column: 1, scope: !68)
!95 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 74, type: !15, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!96 = !DILocalVariable(name: "data", scope: !95, file: !14, line: 76, type: !3)
!97 = !DILocation(line: 76, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !14, line: 77, type: !3)
!99 = !DILocation(line: 77, column: 12, scope: !95)
!100 = !DILocation(line: 77, column: 33, scope: !95)
!101 = !DILocation(line: 78, column: 12, scope: !95)
!102 = !DILocation(line: 78, column: 10, scope: !95)
!103 = !DILocation(line: 79, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !95, file: !14, line: 79, column: 8)
!105 = !DILocation(line: 79, column: 8, scope: !95)
!106 = !DILocation(line: 82, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !14, line: 80, column: 5)
!108 = !DILocation(line: 83, column: 9, scope: !107)
!109 = !DILocation(line: 83, column: 20, scope: !107)
!110 = !DILocation(line: 84, column: 5, scope: !107)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !14, line: 86, type: !35)
!112 = distinct !DILexicalBlock(scope: !95, file: !14, line: 85, column: 5)
!113 = !DILocation(line: 86, column: 14, scope: !112)
!114 = !DILocation(line: 88, column: 9, scope: !112)
!115 = !DILocation(line: 89, column: 9, scope: !112)
!116 = !DILocation(line: 89, column: 20, scope: !112)
!117 = !DILocation(line: 90, column: 19, scope: !112)
!118 = !DILocation(line: 90, column: 9, scope: !112)
!119 = !DILocation(line: 92, column: 1, scope: !95)
