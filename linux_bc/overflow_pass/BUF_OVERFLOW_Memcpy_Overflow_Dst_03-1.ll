; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_03-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_03-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.myStruct = type { i8*, [4 x i8] }

@.str = private unnamed_addr constant [21 x i8] c"01234567890123456789\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !13 {
entry:
  %structCharVoid = alloca %struct.myStruct, align 8
  call void @llvm.dbg.declare(metadata %struct.myStruct* %structCharVoid, metadata !18, metadata !DIExpression()), !dbg !26
  %voidSecond = getelementptr inbounds %struct.myStruct, %struct.myStruct* %structCharVoid, i32 0, i32 0, !dbg !27
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !28
  %charFirst = getelementptr inbounds %struct.myStruct, %struct.myStruct* %structCharVoid, i32 0, i32 1, !dbg !29
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %charFirst, i64 0, i64 0, !dbg !30
  %voidSecond1 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %structCharVoid, i32 0, i32 0, !dbg !31
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 %0, i64 20, i1 false), !dbg !30
  %charFirst2 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %structCharVoid, i32 0, i32 1, !dbg !32
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %charFirst2, i64 0, i64 3, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  ret i32 0, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_03-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 11, type: !15, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_03-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{!17}
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "structCharVoid", scope: !13, file: !14, line: 12, type: !19)
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "myStruct", file: !14, line: 6, size: 128, elements: !20)
!20 = !{!21, !22}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !19, file: !14, line: 7, baseType: !4, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !19, file: !14, line: 8, baseType: !23, size: 32, offset: 64)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 4)
!26 = !DILocation(line: 12, column: 18, scope: !13)
!27 = !DILocation(line: 13, column: 17, scope: !13)
!28 = !DILocation(line: 13, column: 28, scope: !13)
!29 = !DILocation(line: 14, column: 24, scope: !13)
!30 = !DILocation(line: 14, column: 2, scope: !13)
!31 = !DILocation(line: 14, column: 57, scope: !13)
!32 = !DILocation(line: 15, column: 17, scope: !13)
!33 = !DILocation(line: 15, column: 2, scope: !13)
!34 = !DILocation(line: 15, column: 65, scope: !13)
!35 = !DILocation(line: 16, column: 1, scope: !13)
