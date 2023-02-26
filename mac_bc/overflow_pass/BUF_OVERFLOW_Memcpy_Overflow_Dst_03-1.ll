; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.myStruct = type { i8*, [4 x i8] }

@.str = private unnamed_addr constant [21 x i8] c"01234567890123456789\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !13 {
entry:
  %structCharVoid = alloca %struct.myStruct, align 8
  call void @llvm.dbg.declare(metadata %struct.myStruct* %structCharVoid, metadata !19, metadata !DIExpression()), !dbg !27
  %voidSecond = getelementptr inbounds %struct.myStruct, %struct.myStruct* %structCharVoid, i32 0, i32 0, !dbg !28
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !29
  %charFirst = getelementptr inbounds %struct.myStruct, %struct.myStruct* %structCharVoid, i32 0, i32 1, !dbg !30
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %charFirst, i64 0, i64 0, !dbg !30
  %voidSecond1 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %structCharVoid, i32 0, i32 0, !dbg !30
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !30
  %call = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %0, i64 noundef 20, i64 noundef 8) #3, !dbg !30
  %charFirst2 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %structCharVoid, i32 0, i32 1, !dbg !31
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %charFirst2, i64 0, i64 3, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  ret i32 0, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 11, type: !15, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!14 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{!17}
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{}
!19 = !DILocalVariable(name: "structCharVoid", scope: !13, file: !14, line: 12, type: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "myStruct", file: !14, line: 6, size: 128, elements: !21)
!21 = !{!22, !23}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !20, file: !14, line: 7, baseType: !3, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !20, file: !14, line: 8, baseType: !24, size: 32, offset: 64)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 32, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 4)
!27 = !DILocation(line: 12, column: 18, scope: !13)
!28 = !DILocation(line: 13, column: 17, scope: !13)
!29 = !DILocation(line: 13, column: 28, scope: !13)
!30 = !DILocation(line: 14, column: 2, scope: !13)
!31 = !DILocation(line: 15, column: 17, scope: !13)
!32 = !DILocation(line: 15, column: 2, scope: !13)
!33 = !DILocation(line: 15, column: 65, scope: !13)
!34 = !DILocation(line: 16, column: 1, scope: !13)
