; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_14_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !25
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !34
  %cmp1 = icmp eq i32 %2, 5, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !37

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !40
  %4 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end4, !dbg !43

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !49
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !50
  %6 = bitcast i32* %arraydecay to i8*, !dbg !50
  %7 = load i32*, i32** %data, align 8, !dbg !50
  %8 = bitcast i32* %7 to i8*, !dbg !50
  %9 = load i32*, i32** %data, align 8, !dbg !50
  %call5 = call i64 @wcslen(i32* noundef %9), !dbg !50
  %mul = mul i64 %call5, 4, !dbg !50
  %call6 = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %8, i64 noundef %mul, i64 noundef 200) #9, !dbg !50
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !51
  store i32 0, i32* %arrayidx7, align 4, !dbg !52
  %10 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* noundef %10), !dbg !54
  %11 = load i32*, i32** %data, align 8, !dbg !55
  %12 = bitcast i32* %11 to i8*, !dbg !55
  call void @free(i8* noundef %12), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #6

declare i64 @wcslen(i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_14_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* noundef null), !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 noundef %conv), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_14_good(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_14_bad(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !85
  %0 = bitcast i8* %call to i32*, !dbg !86
  store i32* %0, i32** %data, align 8, !dbg !87
  %1 = load i32*, i32** %data, align 8, !dbg !88
  %cmp = icmp eq i32* %1, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !94
  %cmp1 = icmp ne i32 %2, 5, !dbg !96
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !97

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !98
  br label %if.end4, !dbg !100

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !101
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !103
  %4 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !108
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !109
  %6 = bitcast i32* %arraydecay to i8*, !dbg !109
  %7 = load i32*, i32** %data, align 8, !dbg !109
  %8 = bitcast i32* %7 to i8*, !dbg !109
  %9 = load i32*, i32** %data, align 8, !dbg !109
  %call5 = call i64 @wcslen(i32* noundef %9), !dbg !109
  %mul = mul i64 %call5, 4, !dbg !109
  %call6 = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %8, i64 noundef %mul, i64 noundef 200) #9, !dbg !109
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !110
  store i32 0, i32* %arrayidx7, align 4, !dbg !111
  %10 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* noundef %10), !dbg !113
  %11 = load i32*, i32** %data, align 8, !dbg !114
  %12 = bitcast i32* %11 to i8*, !dbg !114
  call void @free(i8* noundef %12), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !120
  %0 = bitcast i8* %call to i32*, !dbg !121
  store i32* %0, i32** %data, align 8, !dbg !122
  %1 = load i32*, i32** %data, align 8, !dbg !123
  %cmp = icmp eq i32* %1, null, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !129
  %cmp1 = icmp eq i32 %2, 5, !dbg !131
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !132

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !133
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !135
  %4 = load i32*, i32** %data, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !136
  store i32 0, i32* %arrayidx, align 4, !dbg !137
  br label %if.end4, !dbg !138

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !139, metadata !DIExpression()), !dbg !141
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !141
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !142
  %6 = bitcast i32* %arraydecay to i8*, !dbg !142
  %7 = load i32*, i32** %data, align 8, !dbg !142
  %8 = bitcast i32* %7 to i8*, !dbg !142
  %9 = load i32*, i32** %data, align 8, !dbg !142
  %call5 = call i64 @wcslen(i32* noundef %9), !dbg !142
  %mul = mul i64 %call5, 4, !dbg !142
  %call6 = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %8, i64 noundef %mul, i64 noundef 200) #9, !dbg !142
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !143
  store i32 0, i32* %arrayidx7, align 4, !dbg !144
  %10 = load i32*, i32** %data, align 8, !dbg !145
  call void @printWLine(i32* noundef %10), !dbg !146
  %11 = load i32*, i32** %data, align 8, !dbg !147
  %12 = bitcast i32* %11 to i8*, !dbg !147
  call void @free(i8* noundef %12), !dbg !148
  ret void, !dbg !149
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9, !10}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_14_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 23, scope: !18)
!26 = !DILocation(line: 26, column: 12, scope: !18)
!27 = !DILocation(line: 26, column: 10, scope: !18)
!28 = !DILocation(line: 27, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 27, column: 9)
!30 = !DILocation(line: 27, column: 14, scope: !29)
!31 = !DILocation(line: 27, column: 9, scope: !18)
!32 = !DILocation(line: 27, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 27, column: 23)
!34 = !DILocation(line: 28, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !18, file: !19, line: 28, column: 8)
!36 = !DILocation(line: 28, column: 18, scope: !35)
!37 = !DILocation(line: 28, column: 8, scope: !18)
!38 = !DILocation(line: 31, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !19, line: 29, column: 5)
!40 = !DILocation(line: 31, column: 9, scope: !39)
!41 = !DILocation(line: 32, column: 9, scope: !39)
!42 = !DILocation(line: 32, column: 21, scope: !39)
!43 = !DILocation(line: 33, column: 5, scope: !39)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !19, line: 35, type: !46)
!45 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 50)
!49 = !DILocation(line: 35, column: 17, scope: !45)
!50 = !DILocation(line: 37, column: 9, scope: !45)
!51 = !DILocation(line: 38, column: 9, scope: !45)
!52 = !DILocation(line: 38, column: 20, scope: !45)
!53 = !DILocation(line: 39, column: 20, scope: !45)
!54 = !DILocation(line: 39, column: 9, scope: !45)
!55 = !DILocation(line: 40, column: 14, scope: !45)
!56 = !DILocation(line: 40, column: 9, scope: !45)
!57 = !DILocation(line: 42, column: 1, scope: !18)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_14_good", scope: !19, file: !19, line: 97, type: !20, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!59 = !DILocation(line: 99, column: 5, scope: !58)
!60 = !DILocation(line: 100, column: 5, scope: !58)
!61 = !DILocation(line: 101, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 113, type: !63, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!63 = !DISubroutineType(types: !64)
!64 = !{!8, !8, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !19, line: 113, type: !8)
!69 = !DILocation(line: 113, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !19, line: 113, type: !65)
!71 = !DILocation(line: 113, column: 27, scope: !62)
!72 = !DILocation(line: 116, column: 22, scope: !62)
!73 = !DILocation(line: 116, column: 12, scope: !62)
!74 = !DILocation(line: 116, column: 5, scope: !62)
!75 = !DILocation(line: 118, column: 5, scope: !62)
!76 = !DILocation(line: 119, column: 5, scope: !62)
!77 = !DILocation(line: 120, column: 5, scope: !62)
!78 = !DILocation(line: 123, column: 5, scope: !62)
!79 = !DILocation(line: 124, column: 5, scope: !62)
!80 = !DILocation(line: 125, column: 5, scope: !62)
!81 = !DILocation(line: 127, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 49, type: !20, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!83 = !DILocalVariable(name: "data", scope: !82, file: !19, line: 51, type: !3)
!84 = !DILocation(line: 51, column: 15, scope: !82)
!85 = !DILocation(line: 52, column: 23, scope: !82)
!86 = !DILocation(line: 52, column: 12, scope: !82)
!87 = !DILocation(line: 52, column: 10, scope: !82)
!88 = !DILocation(line: 53, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !19, line: 53, column: 9)
!90 = !DILocation(line: 53, column: 14, scope: !89)
!91 = !DILocation(line: 53, column: 9, scope: !82)
!92 = !DILocation(line: 53, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !19, line: 53, column: 23)
!94 = !DILocation(line: 54, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !82, file: !19, line: 54, column: 8)
!96 = !DILocation(line: 54, column: 18, scope: !95)
!97 = !DILocation(line: 54, column: 8, scope: !82)
!98 = !DILocation(line: 57, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !19, line: 55, column: 5)
!100 = !DILocation(line: 58, column: 5, scope: !99)
!101 = !DILocation(line: 62, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !19, line: 60, column: 5)
!103 = !DILocation(line: 62, column: 9, scope: !102)
!104 = !DILocation(line: 63, column: 9, scope: !102)
!105 = !DILocation(line: 63, column: 20, scope: !102)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !19, line: 66, type: !46)
!107 = distinct !DILexicalBlock(scope: !82, file: !19, line: 65, column: 5)
!108 = !DILocation(line: 66, column: 17, scope: !107)
!109 = !DILocation(line: 68, column: 9, scope: !107)
!110 = !DILocation(line: 69, column: 9, scope: !107)
!111 = !DILocation(line: 69, column: 20, scope: !107)
!112 = !DILocation(line: 70, column: 20, scope: !107)
!113 = !DILocation(line: 70, column: 9, scope: !107)
!114 = !DILocation(line: 71, column: 14, scope: !107)
!115 = !DILocation(line: 71, column: 9, scope: !107)
!116 = !DILocation(line: 73, column: 1, scope: !82)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 76, type: !20, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!118 = !DILocalVariable(name: "data", scope: !117, file: !19, line: 78, type: !3)
!119 = !DILocation(line: 78, column: 15, scope: !117)
!120 = !DILocation(line: 79, column: 23, scope: !117)
!121 = !DILocation(line: 79, column: 12, scope: !117)
!122 = !DILocation(line: 79, column: 10, scope: !117)
!123 = !DILocation(line: 80, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !19, line: 80, column: 9)
!125 = !DILocation(line: 80, column: 14, scope: !124)
!126 = !DILocation(line: 80, column: 9, scope: !117)
!127 = !DILocation(line: 80, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !19, line: 80, column: 23)
!129 = !DILocation(line: 81, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !117, file: !19, line: 81, column: 8)
!131 = !DILocation(line: 81, column: 18, scope: !130)
!132 = !DILocation(line: 81, column: 8, scope: !117)
!133 = !DILocation(line: 84, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !19, line: 82, column: 5)
!135 = !DILocation(line: 84, column: 9, scope: !134)
!136 = !DILocation(line: 85, column: 9, scope: !134)
!137 = !DILocation(line: 85, column: 20, scope: !134)
!138 = !DILocation(line: 86, column: 5, scope: !134)
!139 = !DILocalVariable(name: "dest", scope: !140, file: !19, line: 88, type: !46)
!140 = distinct !DILexicalBlock(scope: !117, file: !19, line: 87, column: 5)
!141 = !DILocation(line: 88, column: 17, scope: !140)
!142 = !DILocation(line: 90, column: 9, scope: !140)
!143 = !DILocation(line: 91, column: 9, scope: !140)
!144 = !DILocation(line: 91, column: 20, scope: !140)
!145 = !DILocation(line: 92, column: 20, scope: !140)
!146 = !DILocation(line: 92, column: 9, scope: !140)
!147 = !DILocation(line: 93, column: 14, scope: !140)
!148 = !DILocation(line: 93, column: 9, scope: !140)
!149 = !DILocation(line: 95, column: 1, scope: !117)
