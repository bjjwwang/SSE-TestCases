; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21_bad() #0 !dbg !25 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = alloca i8, i64 400, align 16, !dbg !33
  %1 = bitcast i8* %0 to i32*, !dbg !34
  store i32* %1, i32** %dataBuffer, align 8, !dbg !32
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !35
  store i32* %2, i32** %data, align 8, !dbg !36
  store i32 1, i32* @badStatic, align 4, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %call = call i32* @badSource(i32* noundef %3), !dbg !39
  store i32* %call, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !46
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  %call1 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %5), !dbg !49
  %6 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* noundef %6), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @badSource(i32* noundef %data) #0 !dbg !53 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i32, i32* @badStatic, align 4, !dbg !58
  %tobool = icmp ne i32 %0, 0, !dbg !58
  br i1 %tobool, label %if.then, label %if.end, !dbg !60

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !61
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 99), !dbg !63
  %2 = load i32*, i32** %data.addr, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !64
  store i32 0, i32* %arrayidx, align 4, !dbg !65
  br label %if.end, !dbg !66

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !67
  ret i32* %3, !dbg !68
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i32* @wcscat(i32* noundef, i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21_good() #0 !dbg !69 {
entry:
  call void @goodG2B1(), !dbg !70
  call void @goodG2B2(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* noundef null), !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 noundef %conv), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21_good(), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21_bad(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = alloca i8, i64 400, align 16, !dbg !98
  %1 = bitcast i8* %0 to i32*, !dbg !99
  store i32* %1, i32** %dataBuffer, align 8, !dbg !97
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  store i32* %2, i32** %data, align 8, !dbg !101
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %call = call i32* @goodG2B1Source(i32* noundef %3), !dbg !104
  store i32* %call, i32** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !108
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !109
  %5 = load i32*, i32** %data, align 8, !dbg !110
  %call1 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %5), !dbg !111
  %6 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* noundef %6), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @goodG2B1Source(i32* noundef %data) #0 !dbg !115 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !118
  %tobool = icmp ne i32 %0, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.else, !dbg !120

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !121
  br label %if.end, !dbg !123

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !124
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 49), !dbg !126
  %2 = load i32*, i32** %data.addr, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !129
  ret i32* %3, !dbg !130
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !131 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !134, metadata !DIExpression()), !dbg !135
  %0 = alloca i8, i64 400, align 16, !dbg !136
  %1 = bitcast i8* %0 to i32*, !dbg !137
  store i32* %1, i32** %dataBuffer, align 8, !dbg !135
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !138
  store i32* %2, i32** %data, align 8, !dbg !139
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !140
  %3 = load i32*, i32** %data, align 8, !dbg !141
  %call = call i32* @goodG2B2Source(i32* noundef %3), !dbg !142
  store i32* %call, i32** %data, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !144, metadata !DIExpression()), !dbg !146
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !146
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !147
  %5 = load i32*, i32** %data, align 8, !dbg !148
  %call1 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %5), !dbg !149
  %6 = load i32*, i32** %data, align 8, !dbg !150
  call void @printWLine(i32* noundef %6), !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @goodG2B2Source(i32* noundef %data) #0 !dbg !153 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !154, metadata !DIExpression()), !dbg !155
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !156
  %tobool = icmp ne i32 %0, 0, !dbg !156
  br i1 %tobool, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !159
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 49), !dbg !161
  %2 = load i32*, i32** %data.addr, align 8, !dbg !162
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !162
  store i32 0, i32* %arrayidx, align 4, !dbg !163
  br label %if.end, !dbg !164

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !165
  ret i32* %3, !dbg !166
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 24, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 57, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 58, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"PIC Level", i32 2}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"Homebrew clang version 14.0.6"}
!25 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21_bad", scope: !15, file: !15, line: 37, type: !26, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !{}
!29 = !DILocalVariable(name: "data", scope: !25, file: !15, line: 39, type: !5)
!30 = !DILocation(line: 39, column: 15, scope: !25)
!31 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !15, line: 40, type: !5)
!32 = !DILocation(line: 40, column: 15, scope: !25)
!33 = !DILocation(line: 40, column: 39, scope: !25)
!34 = !DILocation(line: 40, column: 28, scope: !25)
!35 = !DILocation(line: 41, column: 12, scope: !25)
!36 = !DILocation(line: 41, column: 10, scope: !25)
!37 = !DILocation(line: 42, column: 15, scope: !25)
!38 = !DILocation(line: 43, column: 22, scope: !25)
!39 = !DILocation(line: 43, column: 12, scope: !25)
!40 = !DILocation(line: 43, column: 10, scope: !25)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !15, line: 45, type: !43)
!42 = distinct !DILexicalBlock(scope: !25, file: !15, line: 44, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 45, column: 17, scope: !42)
!47 = !DILocation(line: 47, column: 16, scope: !42)
!48 = !DILocation(line: 47, column: 22, scope: !42)
!49 = !DILocation(line: 47, column: 9, scope: !42)
!50 = !DILocation(line: 48, column: 20, scope: !42)
!51 = !DILocation(line: 48, column: 9, scope: !42)
!52 = !DILocation(line: 50, column: 1, scope: !25)
!53 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !54, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!54 = !DISubroutineType(types: !55)
!55 = !{!5, !5}
!56 = !DILocalVariable(name: "data", arg: 1, scope: !53, file: !15, line: 26, type: !5)
!57 = !DILocation(line: 26, column: 38, scope: !53)
!58 = !DILocation(line: 28, column: 8, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !15, line: 28, column: 8)
!60 = !DILocation(line: 28, column: 8, scope: !53)
!61 = !DILocation(line: 31, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !15, line: 29, column: 5)
!63 = !DILocation(line: 31, column: 9, scope: !62)
!64 = !DILocation(line: 32, column: 9, scope: !62)
!65 = !DILocation(line: 32, column: 21, scope: !62)
!66 = !DILocation(line: 33, column: 5, scope: !62)
!67 = !DILocation(line: 34, column: 12, scope: !53)
!68 = !DILocation(line: 34, column: 5, scope: !53)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21_good", scope: !15, file: !15, line: 119, type: !26, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!70 = !DILocation(line: 121, column: 5, scope: !69)
!71 = !DILocation(line: 122, column: 5, scope: !69)
!72 = !DILocation(line: 123, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 135, type: !74, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!74 = !DISubroutineType(types: !75)
!75 = !{!10, !10, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !15, line: 135, type: !10)
!80 = !DILocation(line: 135, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !15, line: 135, type: !76)
!82 = !DILocation(line: 135, column: 27, scope: !73)
!83 = !DILocation(line: 138, column: 22, scope: !73)
!84 = !DILocation(line: 138, column: 12, scope: !73)
!85 = !DILocation(line: 138, column: 5, scope: !73)
!86 = !DILocation(line: 140, column: 5, scope: !73)
!87 = !DILocation(line: 141, column: 5, scope: !73)
!88 = !DILocation(line: 142, column: 5, scope: !73)
!89 = !DILocation(line: 145, column: 5, scope: !73)
!90 = !DILocation(line: 146, column: 5, scope: !73)
!91 = !DILocation(line: 147, column: 5, scope: !73)
!92 = !DILocation(line: 149, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 77, type: !26, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!94 = !DILocalVariable(name: "data", scope: !93, file: !15, line: 79, type: !5)
!95 = !DILocation(line: 79, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !15, line: 80, type: !5)
!97 = !DILocation(line: 80, column: 15, scope: !93)
!98 = !DILocation(line: 80, column: 39, scope: !93)
!99 = !DILocation(line: 80, column: 28, scope: !93)
!100 = !DILocation(line: 81, column: 12, scope: !93)
!101 = !DILocation(line: 81, column: 10, scope: !93)
!102 = !DILocation(line: 82, column: 20, scope: !93)
!103 = !DILocation(line: 83, column: 27, scope: !93)
!104 = !DILocation(line: 83, column: 12, scope: !93)
!105 = !DILocation(line: 83, column: 10, scope: !93)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !15, line: 85, type: !43)
!107 = distinct !DILexicalBlock(scope: !93, file: !15, line: 84, column: 5)
!108 = !DILocation(line: 85, column: 17, scope: !107)
!109 = !DILocation(line: 87, column: 16, scope: !107)
!110 = !DILocation(line: 87, column: 22, scope: !107)
!111 = !DILocation(line: 87, column: 9, scope: !107)
!112 = !DILocation(line: 88, column: 20, scope: !107)
!113 = !DILocation(line: 88, column: 9, scope: !107)
!114 = !DILocation(line: 90, column: 1, scope: !93)
!115 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 61, type: !54, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!116 = !DILocalVariable(name: "data", arg: 1, scope: !115, file: !15, line: 61, type: !5)
!117 = !DILocation(line: 61, column: 43, scope: !115)
!118 = !DILocation(line: 63, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !15, line: 63, column: 8)
!120 = !DILocation(line: 63, column: 8, scope: !115)
!121 = !DILocation(line: 66, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !15, line: 64, column: 5)
!123 = !DILocation(line: 67, column: 5, scope: !122)
!124 = !DILocation(line: 71, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !119, file: !15, line: 69, column: 5)
!126 = !DILocation(line: 71, column: 9, scope: !125)
!127 = !DILocation(line: 72, column: 9, scope: !125)
!128 = !DILocation(line: 72, column: 20, scope: !125)
!129 = !DILocation(line: 74, column: 12, scope: !115)
!130 = !DILocation(line: 74, column: 5, scope: !115)
!131 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 104, type: !26, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!132 = !DILocalVariable(name: "data", scope: !131, file: !15, line: 106, type: !5)
!133 = !DILocation(line: 106, column: 15, scope: !131)
!134 = !DILocalVariable(name: "dataBuffer", scope: !131, file: !15, line: 107, type: !5)
!135 = !DILocation(line: 107, column: 15, scope: !131)
!136 = !DILocation(line: 107, column: 39, scope: !131)
!137 = !DILocation(line: 107, column: 28, scope: !131)
!138 = !DILocation(line: 108, column: 12, scope: !131)
!139 = !DILocation(line: 108, column: 10, scope: !131)
!140 = !DILocation(line: 109, column: 20, scope: !131)
!141 = !DILocation(line: 110, column: 27, scope: !131)
!142 = !DILocation(line: 110, column: 12, scope: !131)
!143 = !DILocation(line: 110, column: 10, scope: !131)
!144 = !DILocalVariable(name: "dest", scope: !145, file: !15, line: 112, type: !43)
!145 = distinct !DILexicalBlock(scope: !131, file: !15, line: 111, column: 5)
!146 = !DILocation(line: 112, column: 17, scope: !145)
!147 = !DILocation(line: 114, column: 16, scope: !145)
!148 = !DILocation(line: 114, column: 22, scope: !145)
!149 = !DILocation(line: 114, column: 9, scope: !145)
!150 = !DILocation(line: 115, column: 20, scope: !145)
!151 = !DILocation(line: 115, column: 9, scope: !145)
!152 = !DILocation(line: 117, column: 1, scope: !131)
!153 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 93, type: !54, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!154 = !DILocalVariable(name: "data", arg: 1, scope: !153, file: !15, line: 93, type: !5)
!155 = !DILocation(line: 93, column: 43, scope: !153)
!156 = !DILocation(line: 95, column: 8, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !15, line: 95, column: 8)
!158 = !DILocation(line: 95, column: 8, scope: !153)
!159 = !DILocation(line: 98, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !15, line: 96, column: 5)
!161 = !DILocation(line: 98, column: 9, scope: !160)
!162 = !DILocation(line: 99, column: 9, scope: !160)
!163 = !DILocation(line: 99, column: 20, scope: !160)
!164 = !DILocation(line: 100, column: 5, scope: !160)
!165 = !DILocation(line: 101, column: 12, scope: !153)
!166 = !DILocation(line: 101, column: 5, scope: !153)
