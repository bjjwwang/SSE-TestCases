; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_11_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  store i32* %2, i32** %data, align 8, !dbg !29
  %call = call i32 (...) @globalReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !35
  %4 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !44
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !45
  %6 = bitcast i32* %arraydecay to i8*, !dbg !45
  %7 = load i32*, i32** %data, align 8, !dbg !45
  %8 = bitcast i32* %7 to i8*, !dbg !45
  %9 = load i32*, i32** %data, align 8, !dbg !45
  %call2 = call i64 @wcslen(i32* noundef %9), !dbg !45
  %mul = mul i64 %call2, 4, !dbg !45
  %call3 = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %8, i64 noundef %mul, i64 noundef 200) #5, !dbg !45
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !46
  store i32 0, i32* %arrayidx4, align 4, !dbg !47
  %10 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* noundef %10), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_11_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* noundef null), !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 noundef %conv), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_11_good(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_11_bad(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 400, align 16, !dbg !80
  %1 = bitcast i8* %0 to i32*, !dbg !81
  store i32* %1, i32** %dataBuffer, align 8, !dbg !79
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !82
  store i32* %2, i32** %data, align 8, !dbg !83
  %call = call i32 (...) @globalReturnsFalse(), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !90
  %call1 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !92
  %4 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !97
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !98
  %6 = bitcast i32* %arraydecay to i8*, !dbg !98
  %7 = load i32*, i32** %data, align 8, !dbg !98
  %8 = bitcast i32* %7 to i8*, !dbg !98
  %9 = load i32*, i32** %data, align 8, !dbg !98
  %call2 = call i64 @wcslen(i32* noundef %9), !dbg !98
  %mul = mul i64 %call2, 4, !dbg !98
  %call3 = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %8, i64 noundef %mul, i64 noundef 200) #5, !dbg !98
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !99
  store i32 0, i32* %arrayidx4, align 4, !dbg !100
  %10 = load i32*, i32** %data, align 8, !dbg !101
  call void @printWLine(i32* noundef %10), !dbg !102
  ret void, !dbg !103
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 400, align 16, !dbg !109
  %1 = bitcast i8* %0 to i32*, !dbg !110
  store i32* %1, i32** %dataBuffer, align 8, !dbg !108
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  store i32* %2, i32** %data, align 8, !dbg !112
  %call = call i32 (...) @globalReturnsTrue(), !dbg !113
  %tobool = icmp ne i32 %call, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !116
  %call1 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !118
  %4 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !124
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !125
  %6 = bitcast i32* %arraydecay to i8*, !dbg !125
  %7 = load i32*, i32** %data, align 8, !dbg !125
  %8 = bitcast i32* %7 to i8*, !dbg !125
  %9 = load i32*, i32** %data, align 8, !dbg !125
  %call2 = call i64 @wcslen(i32* noundef %9), !dbg !125
  %mul = mul i64 %call2, 4, !dbg !125
  %call3 = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %8, i64 noundef %mul, i64 noundef 200) #5, !dbg !125
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !126
  store i32 0, i32* %arrayidx4, align 4, !dbg !127
  %10 = load i32*, i32** %data, align 8, !dbg !128
  call void @printWLine(i32* noundef %10), !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_11_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBuffer", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocation(line: 26, column: 39, scope: !17)
!27 = !DILocation(line: 26, column: 28, scope: !17)
!28 = !DILocation(line: 27, column: 12, scope: !17)
!29 = !DILocation(line: 27, column: 10, scope: !17)
!30 = !DILocation(line: 28, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !17, file: !18, line: 28, column: 8)
!32 = !DILocation(line: 28, column: 8, scope: !17)
!33 = !DILocation(line: 31, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !18, line: 29, column: 5)
!35 = !DILocation(line: 31, column: 9, scope: !34)
!36 = !DILocation(line: 32, column: 9, scope: !34)
!37 = !DILocation(line: 32, column: 21, scope: !34)
!38 = !DILocation(line: 33, column: 5, scope: !34)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !18, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !17, file: !18, line: 34, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 35, column: 17, scope: !40)
!45 = !DILocation(line: 37, column: 9, scope: !40)
!46 = !DILocation(line: 38, column: 9, scope: !40)
!47 = !DILocation(line: 38, column: 20, scope: !40)
!48 = !DILocation(line: 39, column: 20, scope: !40)
!49 = !DILocation(line: 39, column: 9, scope: !40)
!50 = !DILocation(line: 41, column: 1, scope: !17)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_11_good", scope: !18, file: !18, line: 94, type: !19, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!52 = !DILocation(line: 96, column: 5, scope: !51)
!53 = !DILocation(line: 97, column: 5, scope: !51)
!54 = !DILocation(line: 98, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 110, type: !56, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!56 = !DISubroutineType(types: !57)
!57 = !{!8, !8, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !18, line: 110, type: !8)
!62 = !DILocation(line: 110, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !18, line: 110, type: !58)
!64 = !DILocation(line: 110, column: 27, scope: !55)
!65 = !DILocation(line: 113, column: 22, scope: !55)
!66 = !DILocation(line: 113, column: 12, scope: !55)
!67 = !DILocation(line: 113, column: 5, scope: !55)
!68 = !DILocation(line: 115, column: 5, scope: !55)
!69 = !DILocation(line: 116, column: 5, scope: !55)
!70 = !DILocation(line: 117, column: 5, scope: !55)
!71 = !DILocation(line: 120, column: 5, scope: !55)
!72 = !DILocation(line: 121, column: 5, scope: !55)
!73 = !DILocation(line: 122, column: 5, scope: !55)
!74 = !DILocation(line: 124, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 48, type: !19, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!76 = !DILocalVariable(name: "data", scope: !75, file: !18, line: 50, type: !3)
!77 = !DILocation(line: 50, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !18, line: 51, type: !3)
!79 = !DILocation(line: 51, column: 15, scope: !75)
!80 = !DILocation(line: 51, column: 39, scope: !75)
!81 = !DILocation(line: 51, column: 28, scope: !75)
!82 = !DILocation(line: 52, column: 12, scope: !75)
!83 = !DILocation(line: 52, column: 10, scope: !75)
!84 = !DILocation(line: 53, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !75, file: !18, line: 53, column: 8)
!86 = !DILocation(line: 53, column: 8, scope: !75)
!87 = !DILocation(line: 56, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !18, line: 54, column: 5)
!89 = !DILocation(line: 57, column: 5, scope: !88)
!90 = !DILocation(line: 61, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !18, line: 59, column: 5)
!92 = !DILocation(line: 61, column: 9, scope: !91)
!93 = !DILocation(line: 62, column: 9, scope: !91)
!94 = !DILocation(line: 62, column: 20, scope: !91)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !18, line: 65, type: !41)
!96 = distinct !DILexicalBlock(scope: !75, file: !18, line: 64, column: 5)
!97 = !DILocation(line: 65, column: 17, scope: !96)
!98 = !DILocation(line: 67, column: 9, scope: !96)
!99 = !DILocation(line: 68, column: 9, scope: !96)
!100 = !DILocation(line: 68, column: 20, scope: !96)
!101 = !DILocation(line: 69, column: 20, scope: !96)
!102 = !DILocation(line: 69, column: 9, scope: !96)
!103 = !DILocation(line: 71, column: 1, scope: !75)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 74, type: !19, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!105 = !DILocalVariable(name: "data", scope: !104, file: !18, line: 76, type: !3)
!106 = !DILocation(line: 76, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !18, line: 77, type: !3)
!108 = !DILocation(line: 77, column: 15, scope: !104)
!109 = !DILocation(line: 77, column: 39, scope: !104)
!110 = !DILocation(line: 77, column: 28, scope: !104)
!111 = !DILocation(line: 78, column: 12, scope: !104)
!112 = !DILocation(line: 78, column: 10, scope: !104)
!113 = !DILocation(line: 79, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !104, file: !18, line: 79, column: 8)
!115 = !DILocation(line: 79, column: 8, scope: !104)
!116 = !DILocation(line: 82, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !18, line: 80, column: 5)
!118 = !DILocation(line: 82, column: 9, scope: !117)
!119 = !DILocation(line: 83, column: 9, scope: !117)
!120 = !DILocation(line: 83, column: 20, scope: !117)
!121 = !DILocation(line: 84, column: 5, scope: !117)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !18, line: 86, type: !41)
!123 = distinct !DILexicalBlock(scope: !104, file: !18, line: 85, column: 5)
!124 = !DILocation(line: 86, column: 17, scope: !123)
!125 = !DILocation(line: 88, column: 9, scope: !123)
!126 = !DILocation(line: 89, column: 9, scope: !123)
!127 = !DILocation(line: 89, column: 20, scope: !123)
!128 = !DILocation(line: 90, column: 20, scope: !123)
!129 = !DILocation(line: 90, column: 9, scope: !123)
!130 = !DILocation(line: 92, column: 1, scope: !104)
