; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 10) #7, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  %0 = load i8*, i8** %data, align 8, !dbg !24
  %cmp = icmp eq i8* %0, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !36
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !36
  %call1 = call i8* @__strcpy_chk(i8* noundef %2, i8* noundef %arraydecay, i64 noundef %4) #9, !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !37
  call void @printLine(i8* noundef %5), !dbg !38
  %6 = load i8*, i8** %data, align 8, !dbg !39
  call void @free(i8* noundef %6), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* noundef null), !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 noundef %conv), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_good(), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_bad(), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i8* null, i8** %data, align 8, !dbg !67
  %call = call i8* @malloc(i64 noundef 11) #7, !dbg !68
  store i8* %call, i8** %data, align 8, !dbg !69
  %0 = load i8*, i8** %data, align 8, !dbg !70
  %cmp = icmp eq i8* %0, null, !dbg !72
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !74
  unreachable, !dbg !74

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !76, metadata !DIExpression()), !dbg !78
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !78
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !78
  %2 = load i8*, i8** %data, align 8, !dbg !79
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !79
  %3 = load i8*, i8** %data, align 8, !dbg !79
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !79
  %call1 = call i8* @__strcpy_chk(i8* noundef %2, i8* noundef %arraydecay, i64 noundef %4) #9, !dbg !79
  %5 = load i8*, i8** %data, align 8, !dbg !80
  call void @printLine(i8* noundef %5), !dbg !81
  %6 = load i8*, i8** %data, align 8, !dbg !82
  call void @free(i8* noundef %6), !dbg !83
  ret void, !dbg !84
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !3)
!20 = !DILocation(line: 30, column: 12, scope: !14)
!21 = !DILocation(line: 31, column: 10, scope: !14)
!22 = !DILocation(line: 33, column: 20, scope: !14)
!23 = !DILocation(line: 33, column: 10, scope: !14)
!24 = !DILocation(line: 34, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 9)
!26 = !DILocation(line: 34, column: 14, scope: !25)
!27 = !DILocation(line: 34, column: 9, scope: !14)
!28 = !DILocation(line: 34, column: 24, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 34, column: 23)
!30 = !DILocalVariable(name: "source", scope: !31, file: !15, line: 36, type: !32)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 36, column: 14, scope: !31)
!36 = !DILocation(line: 38, column: 9, scope: !31)
!37 = !DILocation(line: 39, column: 19, scope: !31)
!38 = !DILocation(line: 39, column: 9, scope: !31)
!39 = !DILocation(line: 40, column: 14, scope: !31)
!40 = !DILocation(line: 40, column: 9, scope: !31)
!41 = !DILocation(line: 42, column: 1, scope: !14)
!42 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_01_good", scope: !15, file: !15, line: 65, type: !16, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!43 = !DILocation(line: 67, column: 5, scope: !42)
!44 = !DILocation(line: 68, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 80, type: !46, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !15, line: 80, type: !48)
!51 = !DILocation(line: 80, column: 14, scope: !45)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !15, line: 80, type: !49)
!53 = !DILocation(line: 80, column: 27, scope: !45)
!54 = !DILocation(line: 83, column: 22, scope: !45)
!55 = !DILocation(line: 83, column: 12, scope: !45)
!56 = !DILocation(line: 83, column: 5, scope: !45)
!57 = !DILocation(line: 85, column: 5, scope: !45)
!58 = !DILocation(line: 86, column: 5, scope: !45)
!59 = !DILocation(line: 87, column: 5, scope: !45)
!60 = !DILocation(line: 90, column: 5, scope: !45)
!61 = !DILocation(line: 91, column: 5, scope: !45)
!62 = !DILocation(line: 92, column: 5, scope: !45)
!63 = !DILocation(line: 94, column: 5, scope: !45)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 49, type: !16, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!65 = !DILocalVariable(name: "data", scope: !64, file: !15, line: 51, type: !3)
!66 = !DILocation(line: 51, column: 12, scope: !64)
!67 = !DILocation(line: 52, column: 10, scope: !64)
!68 = !DILocation(line: 54, column: 20, scope: !64)
!69 = !DILocation(line: 54, column: 10, scope: !64)
!70 = !DILocation(line: 55, column: 9, scope: !71)
!71 = distinct !DILexicalBlock(scope: !64, file: !15, line: 55, column: 9)
!72 = !DILocation(line: 55, column: 14, scope: !71)
!73 = !DILocation(line: 55, column: 9, scope: !64)
!74 = !DILocation(line: 55, column: 24, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !15, line: 55, column: 23)
!76 = !DILocalVariable(name: "source", scope: !77, file: !15, line: 57, type: !32)
!77 = distinct !DILexicalBlock(scope: !64, file: !15, line: 56, column: 5)
!78 = !DILocation(line: 57, column: 14, scope: !77)
!79 = !DILocation(line: 59, column: 9, scope: !77)
!80 = !DILocation(line: 60, column: 19, scope: !77)
!81 = !DILocation(line: 60, column: 9, scope: !77)
!82 = !DILocation(line: 61, column: 14, scope: !77)
!83 = !DILocation(line: 61, column: 9, scope: !77)
!84 = !DILocation(line: 63, column: 1, scope: !64)
